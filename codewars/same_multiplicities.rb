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

def solution(roman)
  symbols = [['M', 1000], ['CM', 900], ['D', 500], ['CD', 400], ['C', 100], ['XC', 90], ['L', 50], ['XL', 40], ['X', 10], ['IX', 9], ['V', 5], ['IV', 4], ['I', 1]]
  arabic_num = 0
  chars = roman.upcase
  symbols.each do |symbol, value|
    while chars.start_with?(symbol)
      arabic_num += value
      chars = chars[symbol.length...chars.length]
    end
  end
  arabic_num
end

puts 'Running tests...'
assert_equal solution('XXI'), 21
assert_equal solution('I'), 1
assert_equal solution('IV'), 4
assert_equal solution('MMVIII'), 2008
assert_equal solution('MDCLXVI'), 1666
puts 'All tests passed.'
