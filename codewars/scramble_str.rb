# Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

# Notes:

#     Only lower case letters will be used (a-z). No punctuation or digits will be included.
#     Performance needs to be considered

# Examples

# scramble('rkqodlw', 'world') ==> True
# scramble('cedewaraaossoqqyt', 'codewars') ==> True
# scramble('katas', 'steak') ==> False

def scramble(s1, s2)
  pop_s2 = s2.chars
  pop_s1 = s1.chars
  pop_s2.size.times do
    if idx = pop_s1.index(pop_s2.last)
      pop_s1.delete_at(idx)
      pop_s2.pop
    end
  end
  pop_s2.empty?
end

p scramble('rkqodlw','world') # true
p scramble('cedewaraaossoqqyt','codewars') # true
p scramble('katas','steak') #false
p scramble('scriptjava','javascript') #true
p scramble('scriptingjava','javascript') #true
