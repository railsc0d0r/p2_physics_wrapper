require 'spec_helper'

describe P2PhysicsWrapper::P2 do
  it "can load p2.js as a V8::Object" do
    expect(P2PhysicsWrapper::P2.is_loaded?).to be_truthy
  end

  it "provides a World-object that can be instanciated" do
    world = P2PhysicsWrapper::P2.World.new
    expect(world['constructor'].name).to eq 'World'
  end

  it "provides a Body-object that can be instanciated" do
    body = P2PhysicsWrapper::P2.Body.new
    expect(body['constructor'].name).to eq 'Body'
  end

  it "provides a Shape-object that can be instanciated" do
    shape = P2PhysicsWrapper::P2.Shape.new
    expect(shape['constructor'].name).to eq 'Shape'
  end

  it "provides a AABB-object that can be instanciated" do
    aabb = P2PhysicsWrapper::P2.AABB.new
    expect(aabb['constructor'].name).to eq 'AABB'
  end

  it "raises a NoMethodError when requested object isn't provided by p2.js" do
    expect{P2PhysicsWrapper::P2.XYZ}.to raise_error(NoMethodError, "Object 'XYZ' undefined by P2PhysicsWrapper::P2")
  end
end
