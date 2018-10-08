# Given a string, find the length of the longest substring without repeating characters.

# Example 1:

# Input: "abcabcbb"
# Output: 3 
# Explanation: The answer is "abc", with the length of 3. 
# Example 2:

# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:

# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3. 
#              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

# @param {String} s
# @return {Integer}

# #Two loops, O(n), use hash
# def length_of_longest_substring(s)
#   exist = {}
#   max_length = 0
#   i = 0

#   s.chars.each_with_index do |char, j|
#     while exist[char]
#       exist[s[i]] = false
#       i += 1
#     end

#     exist[char] = true
#     max_length = [j - i + 1, max_length].max
#   end

#   max_length
# end

# s = 'abcabcbb'
# puts length_of_longest_substring(s)


# Optimize O(n) runtime, O(1) space, 1 loop
def length_of_longest_substring(s)
  char_map = {}
  max_length = 0
  i = 0

  s.chars.each_with_index do |char, j|
    if char_map[char] && char_map[char] >= i
      i = char_map[char] + 1
    end

    char_map[char] = j
    max_length = [j - i + 1, max_length].max
  end

  max_length
end

s = 'abcabcbb'
puts length_of_longest_substring(s)
