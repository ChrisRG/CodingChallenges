# Strip Comments (4 kyu)
# https://www.codewars.com/kata/51c8e37cee245da6b40000bd/train/ruby
#
# Complete the solution so that it strips all text that follows any of a set of comment markers passed in. Any whitespace at the end of the line should also be stripped out.

# Example:

# Given an input string of:

# apples, pears # and bananas
# grapes
# bananas !apples

# The output expected would be:

# apples, pears
# grapes
# bananas

# The code would be called like so:

# result = solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])
# result should == "apples, pears\ngrapes\nbananas"

def check_comments(input, markers)
  lines = input.split("\n")
  output = ''
  lines.each do |line|
    line_end = line.length
    line.chars.each_with_index do |char, index|
      line_end = index if markers.include?(char)
    end
    new_line = line[0...line_end].rstrip
    output += new_line + (line == lines.last ? '' : "\n")
  end
  output
end

def test(input, markers, expected)
  puts "[Input]:\n#{input}\n\n[Markers]: #{markers}"
  puts ''
  solution = check_comments(input, markers)
  puts solution == expected ? '[Success!]' : "[Failed]\n[Output]: \n#{solution}\n\n[Expected]: \n#{expected}"
  puts ''
end

test('apples, plums % and bananas\npears\noranges !applesauce', ['%', '!'], 'apples, plums\npears\noranges')
test('Q @b\nu\ne -e f g', ['@', '-'], 'Q\nu\ne')

# Clever one-liner
#  input.gsub(/\s+[#{markers.join}].*/, "")
