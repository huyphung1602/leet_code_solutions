# Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

# Example 1:

# Input: [3,2,1,5,6,4] and k = 2
# Output: 5
# Example 2:

# Input: [3,2,3,1,2,4,5,5,6] and k = 4
# Output: 4
# Note: 
# You may assume k is always valid, 1 ≤ k ≤ array's length.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  nums = nums.sort
  count = 0

  nums.reverse_each.with_index do |num, index|
    count += 1
    return num if count == k
  end

  nums.last
end

p 'Test 1'
array = [3,2,3,1,2,4,5,5,6]
k = 4
p "Array: #{array}"
p "Sorted Array: #{array.sort}"
p "#{k}th largest element: #{find_kth_largest(array, k)}"
