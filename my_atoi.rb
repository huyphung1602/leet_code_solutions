# Implement atoi which converts a string to an integer.

# The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

# The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

# If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

# If no valid conversion could be performed, a zero value is returned.

# Note:

# Only the space character ' ' is considered as whitespace character.
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2**31,  2**31 − 1]. If the numerical value is out of the range of representable values, INT_MAX (2**31 − 1) or INT_MIN (−2**31) is returned.
# Example 1:

# Input: "42"
# Output: 42
# Example 2:

# Input: "   -42"
# Output: -42
# Explanation: The first non-whitespace character is '-', which is the minus sign.
#              Then take as many numerical digits as possible, which gets 42.
# Example 3:

# Input: "4193 with words"
# Output: 4193
# Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
# Example 4:

# Input: "words and 987"
# Output: 0
# Explanation: The first non-whitespace character is 'w', which is not a numerical 
#              digit or a +/- sign. Therefore no valid conversion could be performed.
# Example 5:

# Input: "-91283472332"
# Output: -2147483648
# Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
#              Thefore INT_MIN (−231) is returned.

# @param {String} str
# @return {Integer}
def my_atoi(str)
  hash_map = {
    '+': true,
    '-': true,
    ' ': true,
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9
  }

  max = 2**31 - 1
  min = -2**31
  sign = 1
  integer = 0

  str.chars.each do |char|
    break if !hash_map[:"#{char}"]

    if char == '-'
      sign = -1
      hash_map[:"-"] = false
      hash_map[:"+"] = false
      hash_map[:" "] = false
    elsif char == '+'
      hash_map[:"-"] = false
      hash_map[:"+"] = false
      hash_map[:" "] = false
    end

    if hash_map[:"#{char}"] && hash_map[:"#{char}"].is_a?(Integer)
      integer = integer * 10 + hash_map[:"#{char}"]

      hash_map[:"-"] = false
      hash_map[:"+"] = false
      hash_map[:" "] = false
    end
  end

  integer = integer * sign

  if integer > max
    max
  elsif integer < min
    min
  else
    integer
  end
end

str = '4193 with words'
puts 'Test 1'
puts str
puts my_atoi(str).inspect

puts

str = 'words and 987'
puts 'Test 2'
puts str
puts my_atoi(str).inspect

puts

str = '-91283472332'
puts 'Test 3'
puts str
puts my_atoi(str).inspect

puts

str = '42'
puts 'Test 4'
puts str
puts my_atoi(str).inspect

puts

str = '3.14'
puts 'Test 5'
puts str
puts my_atoi(str).inspect

puts

str = '-3.14'
puts 'Test 6'
puts str
puts my_atoi(str).inspect

puts

str = '+3.14'
puts 'Test 7'
puts str
puts my_atoi(str).inspect

puts

str = '++3.14'
puts 'Test 8'
puts str
puts my_atoi(str).inspect


puts

str = '+-2'
puts 'Test 9'
puts str
puts my_atoi(str).inspect
