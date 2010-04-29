require 'rubygems'
require 'rake'

require File.dirname(__FILE__) + '/lib/ruby_grep/version'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ruby_grep"
    gem.summary = %Q{Module to search file(s) for lines that match a given pattern.}
    gem.description = %Q{Implementing full functionality of the "grep" command in Unix/Linux system with Ruby. Specification goes to http://www.opengroup.org/onlinepubs/9699919799/utilities/grep.html.}
    gem.email = "jingweno@gmail.com"
    gem.homepage = "http://github.com/jingweno/ruby_grep"
    gem.authors = ["Jingwen Owen Ou"]
    gem.version     = RubyGrep::Version

    gem.add_development_dependency("rspec", ">= 1.2.9")
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby_grep #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
