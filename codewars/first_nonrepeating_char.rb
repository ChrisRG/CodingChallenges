# First non-repeating character (5 kyu)
# https://www.codewars.com/kata/52bc74d4ac05d0945d00054e
# Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

# For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

# As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

# If a string contains all repeating characters, it should return an empty string ("") or None -- see sample tests.
#
# One-liner: 
#  s.chars.find {|i| s.downcase.count(i)==1 || s.upcase.count(i)==1} || ""
#
# More elegant ruby solution:
# def  first_non_repeating_letter(s) 
#  s.each_char do |char|
#    return char if s.downcase.count(char.downcase) < 2
#  end
#  ""
# end

def  first_non_repeating_letter(s) 
  letter_hash = {}
  s.chars.each do |char|
    letter_hash[char.downcase] ? letter_hash[char.downcase] += 1 : letter_hash[char.downcase] = 1
  end
  s.chars.each do |char|
    return char if letter_hash[char.downcase] == 1
  end
  ""
end
