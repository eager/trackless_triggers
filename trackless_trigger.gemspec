# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{trackless_trigger}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson", "Christian Eager"]
  s.date = %q{2009-08-24}
  s.description = %q{Adds support for MySQL triggers in ActiveRecord}
  s.email = %q{christian@perpenduum.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "CHANGELOG",
     "MIT-LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "lib/trigger_migrations.rb",
     "pkg/trackless_trigger-0.0.3.gem",
     "trackless_trigger.gemspec",
     "trackless_trigger.rb"
  ]
  s.homepage = %q{http://github.com/frolic/trackless-trigger}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Adds support for MySQL triggers in ActiveRecord}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
