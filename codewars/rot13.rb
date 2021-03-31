# Rot 13
# https://www.codewars.com/kata/530e15517bc88ac656000716/train/ruby
# ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. ROT13 is an example of the Caesar cipher.

# Create a function that takes a string and returns the string ciphered with Rot13. If there are numbers or special characters included in the string, they should be returned as they are. Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

def rot13(string)
  return string.tr("A-Za-z", "N-ZA-Mn-za-m")
end

# Other good version using modulo for wrapping
# def rot13(string)
#   string.gsub /[a-zA-Z]/ do |s|
#     ascii = s.ord
#     base = if ascii >= 'a'.ord then 'a'.ord else 'A'.ord end
#     ((ascii - base + 13) % 26 + base).chr
#   end
# end

# Testing
def test(input, expected)
  puts "[Input]: #{input}"
  actual = rot13(input)
  puts actual == expected ? "[Success]" : "[Failed]\n[Expected]: #{expected}\n[Actual]: #{actual}\n\n"
end

test("test", "grfg")
test("Test", "Grfg")
