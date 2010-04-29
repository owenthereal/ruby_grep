require 'find'

MatchLine = Struct.new(:path, :line)

# The mixin provides methods to search file(s) for lines that match a given pattern.
module RubyGrep
  def self.included(host_class)
    host_class.extend(ClassMethods)
  end

  module ClassMethods    
    # Recursively grep the line(s) of file(s) in the specified path that 
    # match a given regular expression or a given string of pattern.
    # An optional block can be passed to manipulate the match line(s). 
    # Any option is sliently muted for now.
    def grep(path, reg_exp, options={}, &block)
      if reg_exp.kind_of? String
        reg_exp = /#{Regexp.escape(reg_exp)}/
      end

      matches = []
      Find.find(path) do |p|
        IO.readlines(p).grep(reg_exp) do |line|
          matches << MatchLine.new(p, line.strip)
        end
      end

      # If block is given, manipulate the match lines in the block
      if block_given?
        matches.each do |match|
          block.call(match.path, match.line)
        end
      end

      matches
    end
  end
end

class File
  include RubyGrep

  def grep(pattern, options={}, &block)
    File.grep(self.path, pattern, options, &block)
  end
end