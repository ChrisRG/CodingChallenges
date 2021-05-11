# Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid. The function should return true if the string is valid, and false if it's invalid.
# Examples

# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

# Constraints

# 0 <= input.length <= 100

# Along with opening (() and closing ()) parenthesis, input may contain any valid ASCII characters. Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).

def valid_parentheses(string)
  stack = []
  
  string.strip.chars.each do |char|
    if char == ')'
      return false unless stack.last == '('

      stack.pop
    elsif char == '('
      stack.push(char)
    end
  end
  stack.empty?
end

class Test
  def self.assert_equals(left, right)
    result = left == right ? "PASSED" : "FAILED"
    puts result
    if result == "FAILED"
      puts "Expected: #{right}"
      puts "Got: #{left} \n\n"
    end
  end
end

Test.assert_equals(valid_parentheses("  ("),false)
Test.assert_equals(valid_parentheses(")test"),false)
Test.assert_equals(valid_parentheses(""),true)
Test.assert_equals(valid_parentheses("hi())("),false)
Test.assert_equals(valid_parentheses("hi(hi)()"),true)
