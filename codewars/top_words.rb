# Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.
# Assumptions:

#     A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII. (No need to handle fancy punctuation.)
#     Matches should be case-insensitive, and the words in the result should be lowercased.
#     Ties may be broken arbitrarily.
#     If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.

# Examples:

# top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.")
# # => ["a", "of", "on"]

# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# # => ["e", "ddd", "aa"]

# top_3_words("  //wont won't won't")
# # => ["won't", "wont"]

def top_3_words(text)
  words = extract_words(text) 

  return [] if words.empty?

  words.sort_by {|k, v| v}
    .reverse.to_h.keys.first(3)
end

def extract_words(text)
  words = {}
  text.split.each do |word|
    # Reject unless there are letters or apostrophes and more than 1 letter
    next unless word =~ /[\w|']/ && word[/\w/]
    # Downcase and delete non-letter, non-apostrophe characters
    cleaned = word.downcase.gsub(/[^\w']/, '')
    words[cleaned] ? words[cleaned] += 1 : words[cleaned] = 1
  end
  words
end

# Clever functional approach
#def top_3_words(text)
# text.scan(/[A-Za-z']+/)  -- Iterate through split string, create array of words matching regexp (and removing non-letter, non-apostrophe characters), e.g. //wont => wont
#     .select { |x| /[A-Za-z]+/ =~ x } -- Filter items that have at least one letter
#     .group_by { |x| x.downcase } -- Enumerable group_by => returns hash where keys are evaluated result, values are array of elements that correspond to key, i.e. {"e" => ["e", "E", "e"], "a" => ["a", "A"]}
#     .sort_by { |k,v| -v.count } -- Sort the hash by counting the number of elements in the value array, negative value puts it in descending order
#     .first(3) -- Take the first three items (two-dimensional arrays)
#     .map(&:first) -- Map each array element and convert into just the first item (i.e. the hash key)
# end

class Test
  def self.assert_equals(left, right)
    p left
    p right
    puts left == right ? "TRUE" : "FALSE"
    puts "--"
  end
end
Test.assert_equals(top_3_words("a a a  b  c c  d d d d  e e e e e"), ["e", "d", "a"])
Test.assert_equals(top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"), ["e", "ddd", "aa"])
Test.assert_equals(top_3_words("  //wont won't won't "), ["won't", "wont"])
Test.assert_equals(top_3_words("  , e   .. "), ["e"])
Test.assert_equals(top_3_words("  ...  "), [])
Test.assert_equals(top_3_words("  '  "), [])
Test.assert_equals(top_3_words("  '''  "), [])
