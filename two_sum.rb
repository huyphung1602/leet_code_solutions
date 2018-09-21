# Given an array of integers, find two numbers such that they add up to a specific target number.
# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.
# You may assume that each input would have exactly one solution.

def two_sum(nums, target)
  hash = {}
  
  nums.each_with_index do |num, index|
    unless hash[target-num].nil?
      # +1 because we do both index1 and index2 are not zero-based
      return [hash[target-num] + 1, index + 1]
    end  
    hash[num] = index
  end
end
