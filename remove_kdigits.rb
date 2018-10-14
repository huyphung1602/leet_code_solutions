# Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

# Note:
# The length of num is less than 10002 and will be ≥ k.
# The given num does not contain any leading zero.
# Example 1:

# Input: num = "1432219", k = 3
# Output: "1219"
# Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
# Example 2:

# Input: num = "10200", k = 1
# Output: "200"
# Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
# Example 3:

# Input: num = "10", k = 2
# Output: "0"
# Explanation: Remove all the digits from the number and it is left with nothing which is 0.

# @param {String} num
# @param {Integer} k
# @return {String}
# def remove_kdigits(num, k)
#   return '0' if k >= num.size

#   new_size = num.size - k
#   nums = num.split('')

#   while nums.size > new_size
#     i = 0

#     while i < nums.size - 1
#       if nums[i].to_i > nums[i + 1].to_i
#         nums.delete_at(i)
#         break
#       elsif nums[i].to_i == nums[i + 1].to_i && i == nums.size - 2
#         nums.delete_at(i + 1)
#         break
#       end
#       i += 1
#     end

#     if i == nums.size - 1 && nums.size > k
#       if nums[i - 1].to_i > nums[i].to_i
#         nums.delete_at(i - 1)
#       elsif nums[i - 1].to_i < nums[i].to_i
#         nums.delete_at(i)
#       end
#     end
#   end

#   nums.join('').to_i.to_s
# end

# Optimization
def remove_kdigits(num, k)
  return '0' if k >= num.size

  result = []
  num.chars.each do |d|
    while k!= 0 && !result.empty? && result.last > d
      result.pop
      k -= 1
    end
    result << d
  end
  
  while !result.empty? && k > 0
    result.pop
    k -= 1
  end

  return result.join().to_i.to_s
end

# p 'Test 1'
# num = '1432219'
# k = 3
# p "Input: num = #{num}, k = #{k}"
# p "Output: #{remove_kdigits(num, k)}"

# p 'Test 2'
# num = '112'
# k = 1
# p "Input: num = #{num}, k = #{k}"
# p "Output: #{remove_kdigits(num, k)}"

# p 'Test 3'
# num = '22222222222222222222222222222222222222'
# k = 20
# p "Input: num = #{num}, k = #{k}"
# p "Output: #{remove_kdigits(num, k)}"

# p 'Test 4'
# num = '1111111'
# k = 3
# p "Input: num = #{num}, k = #{k}"
# p "Output: #{remove_kdigits(num, k)}"
