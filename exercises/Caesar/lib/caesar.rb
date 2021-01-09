# Project: Caesar Cipher | The Odin Project
# Author: Pablo Cortez
# Date: 8 December 2020

class Caesar 
  def cipher(string, shift)
    symbols = 'abcdefghijklmnopqrstuvwxyz'
    ciphered_text = ''
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
    ciphered_text
  end
end

caesar = Caesar.new
puts caesar.cipher('What a string!', 5)
puts caesar.cipher('zoo', 1)
# => "Bmfy f xywnsl!"