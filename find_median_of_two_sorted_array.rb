# There are two sorted arrays nums1 and nums2 of size m and n respectively.

# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

# You may assume nums1 and nums2 cannot be both empty.

# Example 1:

# nums1 = [1, 3]
# nums2 = [2]

# The median is 2.0
# Example 2:

# nums1 = [1, 2]
# nums2 = [3, 4]

# The median is (2 + 3)/2 = 2.5

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def median(array, s)
  if s % 2 == 0
    (array[s / 2] + array[s / 2 - 1]).to_f / 2
  else
    array[s / 2]
  end
end

# Same size
def find_median_sorted_arrays(nums1, nums2)
  s = nums1.size

  if s <= 0
    return -1
  elsif s == 1
    return (nums1[0] + nums2[0])/2
  elsif s == 2
    return ([nums1[0], nums2[0]].max + [nums1[1], nums2[1]].min).to_f / 2
  end

  m1 = median(nums1, s)
  m2 = median(nums2, s)

  return m1 if m1 == m2

  if m1 < m2
    new_nums1 = nums1
    new_nums2 = nums2
  else
    new_nums1 = nums2
    new_nums2 = nums1
  end

  if s % 2 == 0
    return find_median_sorted_arrays(new_nums1.slice(s / 2 - 1, s), new_nums2.slice(0, s / 2 + 1))
  else
    return find_median_sorted_arrays(new_nums1.slice(s / 2, s), new_nums2.slice(0, s / 2 + 1))
  end
end

puts 'Test 1'
nums1 = [1, 2, 3, 4]
nums2 = [5, 6, 7, 8]
puts nums1.inspect
puts nums2.inspect
puts find_median_sorted_arrays(nums1, nums2)
puts
puts 'Test 2'
nums1 = [1, 12, 15, 26, 38]
nums2 = [2, 13, 17, 30, 45]
puts nums1.inspect
puts nums2.inspect
puts find_median_sorted_arrays(nums1, nums2)
