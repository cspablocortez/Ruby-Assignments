class Dog
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def bark
    "#{name} says woof!" # call the method instead (https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1#accessormethods). @name works as well though.
  end
end

sparky = Dog.new("Sparky")
puts "Old name: " << sparky.name
sparky.name = "Sputnik"
puts "New name: " << sparky.name