# frozen_string_literal: true

require_relative "lib/omniauth/tiltify/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-tiltify"
  spec.version       = Omniauth::Tiltify::VERSION
  spec.authors       = ["Dean Perry"]
  spec.email         = ["dean@deanpcmad.com"]

  spec.summary       = "OmniAuth strategy for Tiltify"
  spec.homepage      = "https://github.com/deanpcmad/omniauth-tiltify"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth'
  spec.add_dependency 'omniauth-oauth2'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
