# Assignment: Substrings | The Odin Project
# Author: Pablo Cortez
# Date: 8 December 2020

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def substrings(word, array)
  results = Hash.new
  array.each do |substring|
    if word.include?(substring)
      results[substring] = word.scan(substring).length
    end
  end
  return results
end

puts substrings("below", dictionary)
# => { "below" => 1, "low" => 1 }
