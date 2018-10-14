# Given a non-empty array of integers, return the third maximum number in this array. If it does not exist, return the maximum number. The time complexity must be in O(n).

# Example 1:
# Input: [3, 2, 1]

# Output: 1

# Explanation: The third maximum is 1.
# Example 2:
# Input: [1, 2]

# Output: 2

# Explanation: The third maximum does not exist, so the maximum (2) is returned instead.
# Example 3:
# Input: [2, 2, 3, 1]

# Output: 1

# Explanation: Note that the third maximum here means the third maximum distinct number.
# Both numbers with value 2 are both considered as second maximum.

# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  nums = nums.sort
  count = 1

  nums.reverse_each.with_index do |num, index|
    next if index == 0
    count += 1 if num != nums[nums.size - index]
    return num if count == 3
  end

  nums.last
end

nums = [2, 2, 3, 1]
puts third_max(nums)

nums = [1, 2, 2]
puts third_max(nums)

nums = [2, 2]
puts third_max(nums)

nums = [1, 2]
puts third_max(nums)
