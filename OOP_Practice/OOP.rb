class Song
  @@song_count = 0

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @@song_count += 1
  end

  def self.count 
    @@song_count
  end

  def play
    puts "Song is playing..."
  end
end

aSong = Song.new("Cornerstone", "Artic Monkets", 194)
anotherSong = Song.new("Beat It", "Michael Jackson", 320)

p aSong.inspect

p Song.count
p anotherSong.play