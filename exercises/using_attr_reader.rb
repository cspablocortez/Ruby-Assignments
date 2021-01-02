class Person

  attr_reader :name
  attr_accessor :job

  def initialize(name, job)
    @name = name
    @job = job
  end
 

  # To get rid of both getter and setter methods use the attr_accessor 
end

pablo = Person.new("Pablo", "Writer")
pablo.job = "Songwriter"
puts pablo.name
puts pablo.job

puts pablo.inspect