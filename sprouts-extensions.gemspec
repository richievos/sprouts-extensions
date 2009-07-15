# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sprouts-extensions}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richie Vos"]
  s.date = %q{2009-07-15}
  s.email = %q{jerry.vos@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/sprout-extensions.rb"
  ]
  s.homepage = %q{http://github.com/jerryvos/sprout-extensions}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Some extensions to sprout}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
