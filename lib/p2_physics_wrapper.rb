require "p2_physics_wrapper/version"

module P2PhysicsWrapper

  # Extends base w/ ClassMethods, when included
  def self.included(base)
    base.send :extend, ClassMethods
  end

  # Class-methods for models that use p2_physics
  module ClassMethods
  end

  # Instance-methods for models that use p2_physics
  module InstanceMethods
    def method_missing(meth, *args)
      if self.class.respond_to?(meth)
        self.class.send(meth, *args)
      else
        raise NoMethodError.new "method '#{meth}' undefined for class '#{self.class}' or its instances"
      end
    end
  end

end
