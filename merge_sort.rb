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

Comments on Implementation
I factored out the merge portion into a separate function (merge_arrays) so now merge_sort recurses down to individual items which are then fed into the merge_arrays function. Sedgewick/Wayne noted in Algorithms, 4th edition, that MergeSort is basically an orderly way of managing the call to sort the subsets of the array. I think this implementation does that by cleanly separating the recursive splitting of the array from the sorting.

I also considered factoring the initial recursion into a separate function so that the body of merge_sort would read:
  def merge_sort(array, result=[])
    a1, a2 = split_array(array)
    result = merge_arrays(a1, a2)
  end

but that would require adding in extra handling when the array was 1 item and, after accounting for that, the implementation didn't seem any cleaner or easier to understand than beforehand. Given that, I decided this was an appropriate instance to skip Metz's advice that methods be kept to 5 lines or fewer.
=end

def merge_sort(array)
  count = array.count
  mid = (count/2)-1

  if count == 1
    return array
  else
    a1 = merge_sort(array[0..mid])
    a2 = merge_sort(array[mid+1..-1])
  end

  merge_arrays(a1, a2)
end

def merge_arrays(array1, array2)
  result = []
  count = array1.length + array2.length

  count.times do
    if array1.empty?
      result.push(array2.shift)
    elsif array2.empty?
      result.push(array1.shift)
    elsif array1[0] < array2[0]
      result.push(array1.shift)
    else
      result.push(array2.shift)
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
