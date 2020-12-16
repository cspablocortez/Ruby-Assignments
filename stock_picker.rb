# Assignment: Stock Picker | The Odin Project
# Author: Pablo Cortez
# Date: 15 December 2020

stocks = [17,3,6,9,15,8,6,1,10]

def stock_picker(stocks)
  days = Array.new(2) # => [nil, nil]
  sorted_stocks = stocks.sort
  min_index = stocks.index(sorted_stocks.min)
  max_index = stocks.index(sorted_stocks.max)

  while min_index > max_index do
    sorted_stocks.delete(stocks.min)
    sorted_stocks.delete(stocks.max)
    min_index = stocks.index(sorted_stocks.min)
    max_index = stocks.index(sorted_stocks.max)
  end
  
  days = [min_index, max_index]
end

p stock_picker(stocks)
# => [1,4]