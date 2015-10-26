=begin
Merge Sort
http://www.theodinproject.com/ruby-programming/recursion
[Note that the warm-up exercise was already completed during the previous lesson's code quiz.]

Background: Merge Sort CS50 (http://www.youtube.com/watch?v=EeQ8pwjQxTM), Merge Sort: How It Works I (http://www.youtube.com/watch?v=OAsokGNa18k), Merge Sort: How It Works II (http://www.youtube.com/watch?v=nNhpFO9CmPs)

Assignment: 1) Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.

Characteristics of Merge Sort
1) Big O of nlogn #1st video describes it as the fastest sort for the general case.
2) Needs about 50+ items to start seeing efficiency gains over bubble, insertion, or selection sort.

Basic Strategy
1) Split list by halves until you have single item lists
2) For each pair of lists, compare the first item of each list and put the smallest first in a new merged list.
=end

def merge_sort(arr, result=[])
  count = arr.count
  if count == 1
    return arr
  else
    a1 = merge_sort(arr[0..((count/2)-1)])
    a2 = merge_sort(arr[(count/2)..-1])
  end

  count.times do
    if a1.empty?
      result.push(a2.shift)
    elsif a2.empty?
      result.push(a1.shift)
    elsif a1[0] < a2[0]
      result.push(a1.shift)
    else
      result.push(a2.shift)
    end
  end

  result
end


test_array1 = [1, 5, 9, 0, 2, 3, 14, 16]
test_array2 = [9, 5, 9, 5, 6, 3, 1]

puts "Sorting test_array1: #{test_array1}"
puts merge_sort(test_array1).to_s

puts "Sorting test_array2: #{test_array2}"
puts merge_sort(test_array2).to_s
