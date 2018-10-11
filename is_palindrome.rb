# Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

# Example 1:

# Input: 121
# Output: true
# Example 2:

# Input: -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
# Follow up:

# Coud you solve it without converting the integer to a string?

# @param {Integer} x
# @return {Boolean}

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

def is_palindrome(x)
  result = false
  return result if x < 0

  result = true if x == reverse(x)
  result
end
