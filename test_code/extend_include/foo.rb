module Baz
  def say
    puts "Module Baz"
  end
end

module Bar
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def say
      puts "Module Bar"
    end
  end

  def say
    puts "Module Bar"
  end
end

class Foo
  include Bar
  extend Baz
end

Foo.say
Foo.new.say
