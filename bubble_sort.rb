numbers_to_sort = [4,3,78,2,0,2]

def bubble_sort(numbers)
  length = numbers.length - 1
  unsorted = true

  while unsorted
    unsorted = false
    length.times do |index|
      numbers[index], numbers[index+1], unsorted = numbers[index+1], numbers[index], true if numbers[index] > numbers[index+1]
    end
    length -= 1
  end
  puts numbers
end

def bubble_sort_by(array_of_things)
  length = array_of_things.length - 1
  unsorted = true

  while unsorted
    unsorted = false
    length.times do |index|
      if yield(array_of_things[index], array_of_things[index+1]) > 0
        array_of_things[index], array_of_things[index+1], unsorted = array_of_things[index+1], array_of_things[index], true
      end
    end
    length -= 1
  end
  puts array_of_things
end

bubble_sort(numbers_to_sort)
bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length - right.length
end
