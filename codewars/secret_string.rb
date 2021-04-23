# There is a secret string which is unknown to you. Given a collection of random triplets from the string, recover the original string.

# A triplet here is defined as a sequence of three letters such that each letter occurs somewhere before the next in the given string. "whi" is a triplet for the string "whatisup".

# As a simplification, you may assume that no letter occurs more than once in the secret string.

# You can assume nothing about the triplets given to you other than that they are valid triplets and that they contain sufficient information to deduce the original string. In particular, this means that the secret string will never contain letters that do not occur in one of the triplets given to you.

    # modified = false, while modified ...
    # Go through each triplet
    # Go through the chars 0-1
    # If char not in hash, add at index, increment index
    # If the char in the hash:
    # if hash[char0] value is less than hash[char1]
      # modified = true
    #   swap(char0 value, char1 value)
        # return hash.sort_by values
def recover_secret(triplets)
  secret = build_hash(triplets)
  modified = true
  while modified
    modified = false
    triplets.each do |trip|
      trip[0..1].each_with_index do |lett, idx|
        if secret[lett] > secret[trip[idx + 1]]
          modified = true
          tmp = secret[lett]
          secret[lett] = secret[trip[idx + 1]]
          secret[trip[idx + 1]] = tmp
        end
      end
      # if secret[trip[0]] > secret[trip[1]]
      #   modified = true
      #   tmp = secret[trip[0]]
      #   secret[trip[0]] = secret[trip[1]]
      #   secret[trip[1]] = tmp
      # elsif secret[trip[1]] > secret[trip[2]]
      #   modified = true
      #   tmp = secret[trip[1]]
      #   secret[trip[1]] = secret[trip[2]]
      #   secret[trip[2]] = tmp
      # end
    end
  end
  secret.sort_by { |letter, index| index }.to_h.keys.join
end

def build_hash(triplets)
  index = 1
  hash = {}
  triplets.each do |trip|
    trip.each do |letter|
      if !hash[letter]
        hash[letter] = index
        index += 1
      end
    end
  end
  hash
end

secret_1 = "whatisup"
triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

p recover_secret(triplets_1)
p secret_1
