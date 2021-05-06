# You will be given an array of values.

# For simplicity sake you can assume that all the numbers will be non-negative integers.

# The goal is to create a class that handles finding all the values in the array that are within a given range of each other.

# Return the final values in ascending order.
# For Example
# Given

# [5, 32, 5, 1, 31, 70, 30, 8]

# and you want to know all the values that fall within a difference of 2 of each other:
# Should Return

# [5,5,30,31,32]

# If an empty array is given, then an empty array should be returned regardless of the value passed in.

class GroupByDifference
  def initialize(numbers)
    @ary = numbers.sort
  end

  def find(difference)
    return [] if @ary.empty?
    
    index = 0
    diff_ary = []
    while index < @ary.size 
      cluster = [@ary[index]]
      pointer = index + 1
      while pointer < @ary.size && @ary[pointer] <= (@ary[index] + difference)
        cluster << @ary[pointer]
        pointer += 1
      end
      index = pointer
      diff_ary << cluster if cluster.size > 1
    end
    return diff_ary.flatten
  end
end


class Test
  def self.assert_equals(left, right)
    puts left == right ? "PASSED" : "FAILED"
  end
end
  
numbers = [5, 32, 5, 1, 31, 70, 30, 8]
Test.assert_equals(GroupByDifference.new(numbers).find(100), [1,5,5,8,30,31,32,70])
Test.assert_equals(GroupByDifference.new(numbers).find(3), [5,5,8,30,31,32])
Test.assert_equals(GroupByDifference.new(numbers).find(2), [5,5,30,31,32])
Test.assert_equals(GroupByDifference.new(numbers).find(0), [5,5])
Test.assert_equals(GroupByDifference.new([]).find(10), [])

# Clever functional solution
  # def find(difference)
  #   @numbers.sort
  #           .chunk_while { |a, b| b - a <= difference }
  #           .select { |arr| arr.length > 1 }
  #           .flatten
  # end
