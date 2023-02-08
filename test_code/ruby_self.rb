# What does self mean?

class Ghost
  def id
    1
  end

  def get_id
    self.id
  end

  def self.get_id
    self.id
  end

  def self.reflect
    self
  end

  # class << self
  #   def get_id
  #     self.id
  #   end
  #
  #   def reflect
  #     self
  #   end
  # end
end

p Ghost.reflect == Ghost # => true
p Ghost.new.get_id # => 1
p Ghost.get_id # => undefined method `id' for Ghost:Class (NoMethodError)