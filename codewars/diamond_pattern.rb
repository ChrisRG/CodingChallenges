# Task (6 kyu)
# https://www.codewars.com/kata/5503013e34137eeeaa001648/train/ruby

# You need to return a string that looks like a diamond shape when printed on the screen, using asterisk (*) characters. Trailing spaces should be removed, and every line must be terminated with a newline character (\n).

# Return null/nil/None/... if the input is an even number or negative, as it is not possible to print a diamond of even or negative size.
# Examples

# A size 3 diamond:

#  *
# ***
#  *

# ...which would appear as a string of " *\n***\n *\n"
require 'test/unit/assertions'
include Test::Unit::Assertions

def diamond(n)
  # Return nil if n is even or negative
  # Otherwise return single string
  # Each element is blank spaces or stars ending with \n
  # Beginning with 1, add 2 stars to each line until n
  # n - line % 2 = number of spaces on either side
  #   when n = 5, 
  #     line 1 is 2 spaces, *, 2 spaces [n - line = 2]
  #     line 2 is 1 space, ***, 1 space [n - line = 1]
  #     line 3 is 0 spaces, *****, 0 space [n - line = 0]
  #     line 4 is 1 space, ***, 1 space [n - line = 1]
  #     line 5 is 2 spaces, *, 2 spaces  [n - line = 2]
  return nil if n.even? || n <= 0

  diamond_str = ''
  base = (n.to_f / 2).ceil(0)

  (1..n).each do |line|
    spaces = " " * (base - line).abs
    stars = "*" * (n - spaces.length * 2)
    diamond_str.concat("#{spaces}#{stars}\n")
  end
  diamond_str
end

puts "Testing..."
puts "One star"
puts diamond(1)
puts ""
puts "Three stars"
puts diamond(3)
puts ""
puts "Five stars"
puts diamond(5)
puts ""
puts "No stars"
puts diamond(0)
puts "Finished testing."
