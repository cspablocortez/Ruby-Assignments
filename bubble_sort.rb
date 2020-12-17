# Project: Bubble Sort | The Odin Project
# Author: Pablo Cortez
# Date: 16 December 2020

array_1 = [4, 3, 78, 2, 0, 2]
array_2 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

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

p bubble_sort(array_1) 
# => [0, 2, 2, 3, 4, 78]

p bubble_sort(array_2) 
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]