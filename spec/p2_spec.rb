require 'spec_helper'

describe P2PhysicsWrapper::P2 do
  it "can load p2.js as a V8::Object" do
    expect(P2PhysicsWrapper::P2.is_loaded?).to be_truthy
  end

  it "provides a World-object that can be instanciated" do
    world = P2PhysicsWrapper::P2.World.new
    expect(world['constructor'].name).to eq 'World'
  end

  it "provides a Body-object w/ options that can be instanciated" do
    options = {
      mass:10,
      position: [10, 0],
      angle: 0.79,
      velocity: [0, 0],
      angularVelocity: 0
    }
    body = P2PhysicsWrapper::P2.Body.new options
    expect(body['constructor'].name).to eq 'Body'
    expect(body.mass).to eq options[:mass]
    expect(body.position.to_a).to eq options[:position]
    expect(body.angle).to eq options[:angle]
    expect(body.velocity.to_a).to eq options[:velocity]
    expect(body.angularVelocity).to eq options[:angularVelocity]
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

  it "provides a Circle-object w/ options that can be instanciated" do
    options = {
      radius: 10
    }
    circle = P2PhysicsWrapper::P2.Circle.new options
    expect(circle['constructor'].name).to eq 'Circle'
    expect(circle.radius).to eq options[:radius]
  end

  it "can add a shape to the instanciated body" do
    body_options = {
      mass:10,
      position: [10, 0],
      angle: 0.79,
      velocity: [0, 0],
      angularVelocity: 0
    }
    body = P2PhysicsWrapper::P2.Body.new body_options

    circle_options = {
      radius: 10
    }
    circle = P2PhysicsWrapper::P2.Circle.new circle_options

    body.addShape circle
    expect(body.shapes.to_a).not_to be_empty
    expect(body.shapes.first[:constructor].name).to eq "Circle"
    expect(body.shapes.first.radius).to eq circle_options[:radius]
  end

  it "can add an instanciated body to a world" do
    world = P2PhysicsWrapper::P2.World.new

    body_options = {
      mass:10,
      position: [10, 0],
      angle: 0.79,
      velocity: [0, 0],
      angularVelocity: 0
    }
    body = P2PhysicsWrapper::P2.Body.new body_options

    circle_options = {
      radius: 10
    }
    circle = P2PhysicsWrapper::P2.Circle.new circle_options

    body.addShape circle
    world.addBody body
    expect(world.bodies.to_a).not_to be_empty
    expect(world.bodies.first.shapes.first[:constructor].name).to eq "Circle"
    expect(world.bodies.first.shapes.first.radius).to eq circle_options[:radius]
  end

  it "raises a NoMethodError when requested object isn't provided by p2.js" do
    expect{P2PhysicsWrapper::P2.XYZ}.to raise_error(NoMethodError, "Object 'XYZ' undefined by P2PhysicsWrapper::P2")
  end
end
