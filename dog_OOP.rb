# A class without attribute readers, writers, or accessors

class Dog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def bark
    "#{@name} says woof!"
  end
end

sparky = Dog.new("Sparky")
puts sparky.bark
sparky.name = "Sputnik"
puts sparky.name 