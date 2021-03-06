# find_n_smallest.rb 6 kyu

# Your task is to write a function that returns the n smallest elements of an array in original order.
# The number of elements to be returned cannot be higher than the array length, elements can be duplicated,
# in case of duplicates, just return them according to the original order (see third test case).



p first_n_smallest([1,2,3,4,5],3) == [1,2,3]
p first_n_smallest([5,4,3,2,1],3) == [3,2,1]
p first_n_smallest([1,2,3,4,1],3) == [1,2,1]
p first_n_smallest([1,2,3,-4,0],3) == [1,-4,0]
p first_n_smallest([1,2,3,4,5],0) == []
p first_n_smallest([9, -6, 8, 3, -2, 9, 0, -10, 2, 3, 5, 0, 5, -8, 0, 10, 5, 0, -9, 0, -3, 1], 10) == [-6, -2, 0, -10, 0, -8, 0, 0, -9, -3]















#############
=begin
i: arr of int and take number
o: array of n smallest numbers
f:
    dub array, sort it, take fist n
    loop through array,
     see if int is in smallest
     if so move to output
=end

def first_n_smallest(array, n)
  smallest = array.dup
  p smallest = smallest.sort!.take(n)
  output = []
  array.each do |int|
    output << int if smallest.include?(int) && output.count(int) < smallest.count(int)
  end
  output
end

# alternative
=begin
i: array of numbers, n
o: n smalles element in original order as array
f: dup array, sort, take first n
   loop through input array
     if element equals one of the dup array
       move to output and remove from dup (by index)
   return output
=end

def first_n_smallest(arr, n)
  duparr = arr.dup.sort.take(n)
  output = []
  arr.each do |int|
    if duparr.include?(int)
      output << int
      duparr.slice!(duparr.index(int))
    end
  end
  output
end

# alternative
=begin
find n smallest
  array, sort, take n to new array
  loop  array
    if element in new array, write to output
    and delete from new array
=end
def first_n_smallest(array, n)
  smallest = array.sort.take(n)
  output = []
  array.each do |int|
    if smallest.include?(int)
      output << smallest.slice!(smallest.index(int))
    end
  end
  output
end