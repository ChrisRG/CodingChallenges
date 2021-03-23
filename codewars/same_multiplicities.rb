# Are they the same? (6 kyu)
# https://www.codewars.com/kata/550498447451fbbd7600041c/train/ruby
# Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.
# Examples
# Valid arrays

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
#Remarks

#     a or b might be [] (all languages except R, Shell).
#     a or b might be nil or null or None or nothing (except in C++, Elixir, Haskell, PureScript, Pascal, R, Rust, Shell).

# If a or b are nil (or null or None), the problem doesn't make sense so return false.

require 'test/unit/assertions'
include Test::Unit::Assertions

def comp(array1, array2)
  return nil if array1.nil? || array2.nil? || array1.size != array2.size

  array1.sort!
  array2.sort!

  array1.each_with_index do |num, index|
    return false if array2[index] != num**2
  end
  true
end

puts 'Running tests...'
assert_equal(
  comp( [121, 144, 19, 161, 19, 144, 19, 11], 
        [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]),
  true
)
puts 'All tests passed.'
