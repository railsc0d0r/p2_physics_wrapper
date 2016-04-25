require 'v8'

module P2PhysicsWrapper::P2
  @ctx = V8::Context.new
  @ctx['window'] = {}
  path = File.dirname __dir__
  @ctx.load(path + '/p2_physics_wrapper/p2.js')
  @p2 = @ctx['window']['p2']

  class << self
    def is_loaded?
      @p2.class == V8::Object
    end

    def method_missing(meth, *args)
      unless @p2[meth].nil?
        return @p2[meth.to_s]
      else
        raise NoMethodError.new "Object '#{meth}' undefined by P2PhysicsWrapper::P2"
      end
    end

  end
end
