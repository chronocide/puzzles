#!/usr/bin/ruby

# Given an Array A[], find the maximum j - i such that A[j] > A[i]. 
# For example Input {34,8,10,3,2,80,30,33,1} and Output 6 (j=7(33), i=1(34)) 
# Time Complexity should be less then O(n^2)

class Array
  def maxgap
    adjusted_size = self.size - 1
    # If all elements are equal, return zero
    if self.count(self[0]) == self.size
      return 0
    end
    # If elements are sorted in descending order, return -1
    # which is the lowest return possible
    for i in 1..adjusted_size do
      if self[i - 1] >= self[i] && i == adjusted_size
        return -1
      elsif self[i - 1] >= self[i]
        next
      else
        break
      end
    end
    # Look for all possible results between max and 2
    adjusted_size.downto(2) do |max_length|
      for i in 0..adjusted_size - max_length do
        if self[i + max_length] > self[i]
          return max_length
        end
      end
    end
    # At this stage, all possible results besides 1 are
    # ruled out so 1 must be the correct answer.
    return 1
  end
end

puts [34,8,10,3,2,80,30,33,1].maxgap      
# => 6