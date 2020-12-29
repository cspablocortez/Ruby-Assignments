class Computer
  @@users = {} # would you use attr_accessor on this? It looks like attr_accessor is for instance variables, not class variables, thus no.

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} created by #{@username} at #{time}."
  end

  def Computer.get_users
    @@users
  end
end


unix = Computer.new("admin", "password")
raspberryPi = Computer.new("raspberrypi", "password")
unix.create(".vimrc")

puts Computer.get_users