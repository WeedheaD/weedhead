# -*- encoding: utf-8 -*-
# stub: mina-puma 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "mina-puma".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tobias Sandelius".freeze]
  s.date = "2017-01-18"
  s.description = "Puma tasks for Mina".freeze
  s.email = ["tobias@sandeli.us".freeze]
  s.homepage = "https://github.com/sandelius/mina-puma".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Puma tasks for Mina".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mina>.freeze, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<puma>.freeze, [">= 2.13"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<mina>.freeze, ["~> 1.0.0"])
      s.add_dependency(%q<puma>.freeze, [">= 2.13"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<mina>.freeze, ["~> 1.0.0"])
    s.add_dependency(%q<puma>.freeze, [">= 2.13"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
