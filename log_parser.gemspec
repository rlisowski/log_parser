# frozen_string_literal: true

require_relative "lib/log_parser/version"

Gem::Specification.new do |spec|
  spec.name = "log_parser"
  spec.version = LogParser::VERSION
  spec.authors = ["Rafał Lisowski"]
  spec.email = ["lisowski.r@gmail.com"]

  spec.summary = "Parse log fiel and show requests counts."
  spec.description = "Parse log fiel and show requests counts."
  spec.homepage = "https://github.com/rlisowski/log_parser"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rlisowski/log_parser"
  spec.metadata["changelog_uri"] = "https://github.com/rlisowski/log_parser"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sequel"
  spec.add_dependency "sqlite3"
  spec.add_dependency "thor"
end
