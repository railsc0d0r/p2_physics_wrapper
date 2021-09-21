# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'p2_physics_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "p2_physics_wrapper"
  spec.version       = P2PhysicsWrapper::VERSION
  spec.authors       = ["Stephan Barth"]
  spec.email         = ["railsc0d0r@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{ Wrapper for p2.js to execute stuff in ruby on server-side}
  spec.description   = %q{ Uses therubyracer to wrap https://github.com/schteppe/p2.js in ruby so it can be used server-side dertermine the physics of a phaser-based multiplayer-game. }
  spec.homepage      = "https://github.com/railsc0d0r/p2_physics_wrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "byebug"

  spec.add_dependency "therubyracer"
end
