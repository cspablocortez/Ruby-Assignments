# Project: Bubble Sort | The Odin Project
# Author: Pablo Cortez
# Date: 16 December 2020

array = [4, 3, 78, 2, 0, 2]

def bubble_sort(array)
  array.length.times do
    array.each_index do |i|
      unless i == array.length - 1
        if array[i] > array[i+1] 
          temp = array[i]
          array[i] = array[i+1]
          array[i+1] = temp
        end
      end
    end
  end
  array
end

p bubble_sort(array) 
# => [0, 2, 2, 3, 4, 78]