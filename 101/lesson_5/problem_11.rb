# problem_11.rb

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are
# multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

output =
arr.map do |sub_array|
  sub_array.select { |int| int % 3 == 0 }
end

p output