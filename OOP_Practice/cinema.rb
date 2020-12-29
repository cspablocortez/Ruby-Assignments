# Cinema Class

class Cinema
  attr_accessor :name, :location
  def initialize(name, street, city, state, zip)
    self.name = name
    self.location = {
      street: street,
      city: city,
      state: state,
      zip: zip
    }
  end

  def to_s
    "Name: #{name}\nLocation: #{location.values.join(", ")}"
  end
end

regal = Cinema.new("Regal", "265 Court St", "Brooklyn", "NY", "11231")
puts regal

#puts regal.location[:zip] # why use symbols in hashes? - because they are immutable strings, saving memory (only one ID)
