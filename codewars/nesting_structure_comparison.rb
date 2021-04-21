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
rr
# # should return false
# [ [ [ ], [ ] ] ].same_structure_as( [ [ 1, 1 ] ] )  

class Array
  def same_structure_as(other_arr) # returns true or false
      
  end

  def analyze_struct(arr, structure = [])
    count = 0
    arr.each do |element|
      unless element.is_a?
        count += 1
      else
        analyze_struct(element, structure)
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
# structure << [
