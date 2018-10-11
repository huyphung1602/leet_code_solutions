# Given a 32-bit signed integer, reverse digits of an integer.

# Example 1:

# Input: 123
# Output: 321
# Example 2:

# Input: -123
# Output: -321
# Example 3:

# Input: 120
# Output: 21
# Note:
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

# @param {Integer} x
# @return {Integer}
def reverse(x)
  rev = 0
  a = 1
  if x < 0
    a = -1
    x = -x
  end


  while x > 0
    pop = x % 10
    x /= 10
    rev = rev * 10 + pop
  end

  rev = rev * a
  if (rev >= 2**31 - 1) || (rev <=  -2**31)
    0
  else
    rev
  end
end

x = 12345677
puts x
puts reverse(x).inspect

x = -123
puts x
puts reverse(x).inspect

x = 1534236469
puts x
puts reverse(x).inspect
