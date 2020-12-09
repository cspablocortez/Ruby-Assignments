# Project: Caesar Cipher | The Odin Project
# Author: Pablo Cortez
# Date: 8 December 2020

def caesar_cipher(string, shift)
  symbols = "abcdefghijklmnopqrstuvwxyz"
  ciphered_text = ""
  string.each_char do |char|
    if char.match(/[A-Z]/) 
      new_index = (symbols.index(char.downcase) + shift) % symbols.length
      ciphered_text += symbols[new_index].upcase
      next
    end
    if symbols.include?(char) 
      new_index = (symbols.index(char) + shift) % symbols.length
      ciphered_text += symbols[new_index]
    else
      ciphered_text += char
    end
  end
  return ciphered_text
end

# Get index of capital letter
# Turn that index to upcase

puts caesar_cipher("What a string!", 5)
puts caesar_cipher("zoo", 1)
# => "Bmfy f xywnsl!"