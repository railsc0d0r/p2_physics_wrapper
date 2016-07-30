require 'spec_helper'

describe P2PhysicsWrapper::P2 do
  before do
    @circle_options = {
      radius: 10
    }
    @circle = P2PhysicsWrapper::P2.Circle.new @circle_options

    @body_options = {
      mass:10,
      position: [10, 0],
      angle: 0.79,
      velocity: [0, 0],
      angularVelocity: 0
    }
    @body = P2PhysicsWrapper::P2.Body.new @body_options

    @world = P2PhysicsWrapper::P2.World.new
  end

  it "can load p2.js as a V8::Object" do
    expect(P2PhysicsWrapper::P2.is_loaded?).to be_truthy
  end

  it "provides a World-object that can be instanciated" do
    expect(@world['constructor'].name).to eq 'World'
  end

  it "provides a Body-object that can be instanciated w/ options" do
    expect(@body['constructor'].name).to eq 'Body'
    expect(@body.mass).to eq @body_options[:mass]
    expect(@body.position.to_a).to eq @body_options[:position]
    expect(@body.angle).to eq @body_options[:angle]
    expect(@body.velocity.to_a).to eq @body_options[:velocity]
    expect(@body.angularVelocity).to eq @body_options[:angularVelocity]
  end

  it "provides a Line-object that can be instanciated" do
    line = P2PhysicsWrapper::P2.Line.new
    expect(line['constructor'].name).to eq 'Line'
  end

  it "provides a Convex-object that can be instanciated" do
    convex = P2PhysicsWrapper::P2.Convex.new
    expect(convex['constructor'].name).to eq 'Convex'
  end

  it "provides a Shape-object that can be instanciated" do
    shape = P2PhysicsWrapper::P2.Shape.new
    expect(shape['constructor'].name).to eq 'Shape'
  end

  it "provides a Circle-object that can be instanciated w/ options" do
    expect(@circle['constructor'].name).to eq 'Circle'
    expect(@circle.radius).to eq @circle_options[:radius]
  end

  it "can add a circle as a shape to the instanciated body" do
    @body.addShape @circle
    expect(@body.shapes.to_a).not_to be_empty
    expect(@body.shapes.first[:constructor].name).to eq "Circle"
    expect(@body.shapes.first.radius).to eq @circle_options[:radius]
  end

  it "can add a defined convex as a shape to the instanciated body" do
    convex_options = { vertices:
      [
        [-1.3282, 0.6085],
        [-1.3282, -0.6085],
        [-1.27, -0.5397000000000001],
        [-1.27, 0.5397000000000001]
      ]
    }
    convex = P2PhysicsWrapper::P2.Convex.new convex_options
    @body.addShape convex
    expect(@body.shapes.to_a).not_to be_empty
    expect(@body.shapes.first[:constructor].name).to eq "Convex"
    expect(@body.shapes.first.vertices.map {|v| v.to_a}).to eq convex_options[:vertices]
  end

  it "can add an instanciated body to a world" do
    @body.addShape @circle
    @world.addBody @body
    expect(@world.bodies.to_a).not_to be_empty
    expect(@world.bodies.first.shapes.first[:constructor].name).to eq "Circle"
    expect(@world.bodies.first.shapes.first.radius).to eq @circle_options[:radius]
  end

  it "raises a NoMethodError when requested object isn't provided by p2.js" do
    expect{P2PhysicsWrapper::P2.XYZ}.to raise_error(NoMethodError, "Object 'XYZ' undefined by P2PhysicsWrapper::P2")
  end
end
