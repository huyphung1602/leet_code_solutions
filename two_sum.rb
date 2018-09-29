# Given an array of integers, find two numbers such that they add up to a specific target number.
# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
# You may assume that each input would have exactly one solution.

def two_sum(nums, target)
  hash = {}

  nums.each_with_index do |num, index|
    # +1 because we do both index1 and index2 are not zero-based
    one_based_index = index + 1

    unless hash[target-num].nil?
      return [hash[target-num], one_based_index]
    end
    hash[num] = one_based_index
  end
end
