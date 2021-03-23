# Your order, please (6 kyu)
#  https://www.codewars.com/kata/55c45be3b2079eccff00010f/train/ruby 
# Your task is to sort a given string. Each word in the string will contain a single number. This number is the position the word should have in the result.

# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).

# If the input string is empty, return an empty string. The words in the input String will only contain valid consecutive numbers.
# Examples

# "is2 Thi1s T4est 3a"  -->  "Thi1s is2 3a T4est"
# "4of Fo1r pe6ople g3ood th5e the2"  -->  "Fo1r the2 g3ood 4of th5e pe6ople"
# ""  -->  ""

require 'test/unit/assertions'
include Test::Unit::Assertions

def order(words)
  return '' if words.empty?

  word_array = words.split
  ordered_string = []
  until ordered_string.size == word_array.size
    word_array.each do |word|
      number = word[/[1-9]/].to_i
      ordered_string << word if number == ordered_string.size + 1
    end
  end
  ordered_string.join(' ')
end

puts 'Running tests...'
assert_equal(order('is2 Thi1s T4est 3a'), 'Thi1s is2 3a T4est')
assert_equal(order('4of Fo1r pe6ople g3ood th5e the2'), 'Fo1r the2 g3ood 4of th5e pe6ople')
assert_equal(order(''), '', 'Empty input should return empty string')
puts 'All tests passed.'
