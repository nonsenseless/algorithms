# algorithms
A repository for implementations of standard algorithms in Ruby (and, where circumstances require, Java). As part of my work for The Odin Project and a series of online algorithms courses, I'll be writing implementations several different algorithms. Rather than clutter up github with a dozen different repos, I'm going to drop them all in here.
For Ruby-based implementations, I'll eventually add an RSpec-based test suite.


Algorithm Summaries

Bubble Sort aka Sinking Sort (Ruby)
  Bubble Sort is an extremely simple (and costly) sorting algorithm that operates by comparing adjacent elements and swapping them if the first is larger. The operation proceeds throughout the set and repeats until the array is sorted.

  Sorting n elements with bubble sort can potentially require (n-1) iterations through the set and results in big O complexity n**2. As far as I can tell, it's only purpose is to serve as "My First Algorithm" before students learn something worthwhile. Even the undergrad they got to put together this video (http://cdn.cs50.net/2012/fall/shorts/bubble_sort/bubble_sort-720p.mp4?download) seems bored by it.

  Optimizations
    In order to minimize processing time, we'll add two minor tweaks:
      1) Reduce array length: Every pass through the elements, n, pushes the nth largest value to its proper place at the end of the set. The 1st pass moves the largest element to the last spot in the array. The 2nd pass moves the second-largest element to the second-to-last spot, and so on. Recognizing this, we can sort 1 fewer elements each pass through the data set.
      2) Sorted? flag: If the algorithm doesn't sort any elements during a pass, we assume this is because the set is sorted and we can stop. A true/false "Sorted?" flag will be used to monitor this condition.

  Pseudocode Implementation
    #Given an array of elements
      #Set a flag "Sorted?" = false
      #array.length times loop through the elements [0..-(index+1)]
        #For each element, array[i]
          #Compare it to the element array[i+1]
          #If the first element is larger than the second, swap them
