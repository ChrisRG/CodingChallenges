# Complete the function/method (depending on the language) to return true/True when its argument is an array that has the same nesting structures and same corresponding length of nested arrays as the first array.

# For example:
# # should return true
# [ 1, 1, 1 ].same_structure_as( [ 2, 2, 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] )

# # should return false 
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2, 2 ], 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ [ 2 ], 2 ] )

# # should return true
# [ [ [ ], [ ] ] ].same_structure_as( [ [ [ ], [ ] ] ] ); 
# # should return false
# [ [ [ ], [ ] ] ].same_structure_as( [ [ 1, 1 ] ] )  

class Array
  def same_structure_as(other_arr) # returns true or false
    return true if analyze_struct == other_arr.analyze_struct
  end

  def analyze_struct(structure = [])
    count = 0
    self.each do |element|
      unless element.is_a?(Array)
        count += 1
      else
        structure << count
        count = 0
        element.analyze_struct(structure)
      end
    end
    structure << count
    return structure
  end
end

# [1, 1, 1]
# structure = [3]
#
# [1, [1, 1]]
# count = 1
# [1, 1]
# count = 2
# return [2]
# structre [2]
# structure << [2, [3]
arr0 = Array.new([1, 1, 1])
arr1 = Array.new([1, [1, 1]])
arr2 = Array.new([[2, 2], 1])
p arr0.analyze_struct
puts "---"
p arr1.analyze_struct
puts "---"
p arr2.analyze_struct
