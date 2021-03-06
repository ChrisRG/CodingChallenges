# Introduction

# There is a war and nobody knows - the alphabet war!
# The letters hide in their nuclear shelters. The nuclear strikes hit the battlefield and killed a lot of them.
# Task

# Write a function that accepts battlefield string and returns letters that survived the nuclear strike.

#     The battlefield string consists of only small letters, #,[ and ].
#     The nuclear shelter is represented by square brackets []. The letters inside the square brackets represent letters inside the shelter.
#     The # means a place where nuclear strike hit the battlefield. If there is at least one # on the battlefield, all letters outside of shelter die. When there is no any # on the battlefield, all letters survive (but do not expect such scenario too often ;-P ).
#     The shelters have some durability. When 2 or more # hit close to the shelter, the shelter is destroyed and all letters inside evaporate. The 'close to the shelter' means on the ground between the shelter and the next shelter (or beginning/end of battlefield). The below samples make it clear for you.

# Example

# abde[fgh]ijk     => "abdefghijk"  (all letters survive because there is no # )
# ab#de[fgh]ijk    => "fgh" (all letters outside die because there is a # )
# ab#de[fgh]ij#k   => ""  (all letters dies, there are 2 # close to the shellter )
# ##abde[fgh]ijk   => ""  (all letters dies, there are 2 # close to the shellter )
# ##abde[fgh]ijk[mn]op => "mn" (letters from the second shelter survive, there is no # close)
# #ab#de[fgh]ijk[mn]op => "mn" (letters from the second shelter survive, there is no # close)
# #abde[fgh]i#jk[mn]op => "mn" (letters from the second shelter survive, there is only 1 # close)
# [a]#[b]#[c]  => "ac"
# [a]#b#[c][d] => "d"
# [a][b][c]    => "abc"
# ##a[a]b[c]#  => "c"

def alphabetWar(battlefield)
  return battlefield.gsub(/[^\w]/, '') unless battlefield.include?('#')
  bombs_shelters = battlefield.scan(/(#+|\[[a-z]+\]+)/).flatten # Look for either 1 or more #s or bracketed strings
  temp_survivors = []
  survivors = []
  bombs_shelters.each do |element|
    if temp_survivors.empty?
      temp_survivors << element
    elsif element.include?('#') && temp_survivors.last.include?('#')
      temp_survivors << element
    elsif element.include?('#') && !temp_survivors.last.include?('#')
      temp_survivors << element
      survivors << check_situation(temp_survivors)
      temp_survivors = [element]
    elsif !element.include?('#') && !temp_survivors.last.include?('#')
      survivors << check_situation(temp_survivors)
      temp_survivors = [element]
    else
      temp_survivors << element
    end
  end
  survivors << check_situation(temp_survivors)

  survivors.join.gsub(/[^\w]/, '')
end

def check_situation(temp_survivors)
  if temp_survivors.join.count('#') >= 2
    return ''
  else
    return temp_survivors.join.gsub(/[^\w]/, '')
  end
end


class Test
  def self.assert_equals(left, right)
    puts left == right ? "PASSED" : "FAILED"
  end
end

Test.assert_equals(alphabetWar('abde[fgh]ijk'), 'abdefghijk')
Test.assert_equals(alphabetWar('ab#de[fgh]ijk'), 'fgh')
Test.assert_equals(alphabetWar('ab#de[fgh]ij#k'), '')
Test.assert_equals(alphabetWar('##abde[fgh]ijk'), '')
Test.assert_equals(alphabetWar('##abde[fgh]ijk[mn]op'), 'mn')
Test.assert_equals(alphabetWar('#abde[fgh]i#jk[mn]op'), 'mn')
Test.assert_equals(alphabetWar('[ab]adfd[dd]##[abe]dedf[ijk]d#d[h]#'), 'abijk')
Test.assert_equals(alphabetWar('##abde[fgh]'), '')  
Test.assert_equals(alphabetWar('abde[fgh]'), 'abdefgh')  
Test.assert_equals(alphabetWar('#[a]#[b]#'), '')    
Test.assert_equals(alphabetWar('[a]##[b]'), '')     
Test.assert_equals(alphabetWar('[a]a[b]'), 'aab') 
