require 'v8'

module P2PhysicsWrapper::P2
  @ctx = V8::Context.new
  @ctx['window'] = {}
  gem_root = FileUtils.pwd
  @ctx.load(gem_root + '/lib/p2_physics_wrapper/p2.js')
  @p2 = @ctx['window']['p2']

  class << self
    def is_loaded?
      @p2.class == V8::Object
    end

    def World
      @p2['World']
    end

    def Body
      @p2['Body']
    end

    def Shape
      @p2['Shape']
    end

    def AABB
      @p2['AABB']
    end
  end
end
