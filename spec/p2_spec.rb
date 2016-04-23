require 'spec_helper'

describe P2PhysicsWrapper::P2 do
  it "can load p2.js as a V8::Object" do
    expect(P2PhysicsWrapper::P2.is_loaded?).to be_truthy
  end
end
