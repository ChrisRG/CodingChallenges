def two_sum(numbers, target)
  hash = {}
  (0..numbers.length - 1).each do |i|
    complement = target - numbers[i]
    if hash.key?(complement)
      return [hash[complement], i]
    end
    hash[numbers[i]] = i
  end
end

puts "Testing array [1, 2, 3] target 4"
puts "Expected [0, 2]"
puts "Result: #{two_sum([1, 2, 3], 4)}"
