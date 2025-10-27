# -*- encoding: utf-8 -*-
# stub: immutable-ruby 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "immutable-ruby".freeze
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex Dowad".freeze, "Dov Murik".freeze, "Xavier Shay".freeze, "Simon Harris".freeze]
  s.date = "2024-04-20"
  s.description = "Efficient, immutable, thread-safe collection classes for Ruby".freeze
  s.email = ["alexinbeijing@gmail.com".freeze]
  s.homepage = "https://github.com/immutable-ruby/immutable-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Efficient, immutable, thread-safe collection classes for Ruby".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<concurrent-ruby>.freeze, ["~> 1.1"])
  s.add_runtime_dependency(%q<sorted_set>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 2.2.10"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.9"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.13"])
  s.add_development_dependency(%q<pry-doc>.freeze, ["~> 1.0.0"])
  s.add_development_dependency(%q<benchmark-ips>.freeze, ["~> 2.7"])
end
