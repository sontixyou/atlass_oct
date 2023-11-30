# frozen_string_literal: true

require_relative "lib/atlass_oct/version"

Gem::Specification.new do |spec|
  spec.name = "atlass_oct"
  spec.version = AtlassOct::VERSION
  spec.authors = ["kenken"]
  spec.email = ["kengoviolinphoto@gmail.com"]

  spec.summary = "This gem conver jira test to GitHub markdown."
  spec.description = "This gem conver jira test to GitHub markdown."
  spec.homepage = "https://sontixyou.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://sontixyou.com"
  spec.metadata["changelog_uri"] = "https://sontixyou.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end