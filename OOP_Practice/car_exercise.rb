=begin
1. Create a class called MyCar. When you initialize a new instance or 
object of the class, allow the user to define some instance variables 
that tell us the year, color, and model of the car. Create an instance 
variable that is set to 0 during instantiation of the object to track the 
current speed of the car as well. Create instance methods that allow the car 
to speed up, brake, and shut the car off.

2. Create a superclass called Vehicle for your MyCar class to inherit from 
and move the behavior that isn't specific to the MyCar class to the superclass. 
Create a constant in your MyCar class that stores information about the vehicle 
that makes it different from other types of Vehicles.
=end

class Vehicle
  attr_accessor :speed, :color
  attr_reader :model, :year
  def initialize(year, color, model)
    self.speed = 0
    @year = year
    self.color = color
    @model = model
  end

  def accelerate(distance=10)
    puts "Accelerating by #{distance} miles per hour."
    self.speed += distance
  end

  def brake
    self.speed = 0
    puts "Brakes engaged."
  end

  def shut_off
    puts "Car is shutting off."
  end

  def gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "This is a #{self.year} #{self.color} #{self.model}"
  end
end

class MyCar < Vehicle# classes are CamelCase

end


my_car = MyCar.new(2009, "Black", "Altima")
p my_car # same thing as doing "puts object.inspect"
my_car.accelerate
puts my_car # puts method calls obj.to_s 
my_car.color = "Gold"
my_car.brake
my_car.shut_off
p my_car
