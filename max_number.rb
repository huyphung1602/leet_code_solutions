# Given two arrays of length m and n with digits 0-9 representing two numbers. Create the maximum number of length k <= m + n from digits of the two. The relative order of the digits from the same array must be preserved. Return an array of the k digits.

# Note: You should try to optimize your time and space complexity.

# Example 1:

# Input:
# nums1 = [3, 4, 6, 5]
# nums2 = [9, 1, 2, 5, 8, 3]
# k = 5
# Output:
# [9, 8, 6, 5, 3]
# Example 2:

# Input:
# nums1 = [6, 7]
# nums2 = [6, 0, 4]
# k = 5
# Output:
# [6, 7, 6, 0, 4]
# Example 3:

# Input:
# nums1 = [3, 9]
# nums2 = [8, 9]
# k = 3
# Output:
# [9, 8, 9]

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}

# def max_number_possible_first(nums1, nums2, k)
#   result = []

#   until nums1.empty? && nums2.empty? || k == 0
#     size1 = nums1.size
#     size2 = nums2.size


#     max1 = nums1.slice(0, size1 + size2 - k + 1).max || -1
#     max2 = nums2.slice(0, size1 + size2 - k + 1).max || -1

#     if max1 > max2
#       result << max1
#       nums1 = nums1.slice(nums1.index(max1) + 1, size1)
#     elsif max2 > max1
#       result << max2
#       nums2 = nums2.slice(nums2.index(max2) + 1, size2)
#     else
#       result << max1
#       nums1 = nums1.slice(nums1.index(max1) + 1, size1)
#     end

#     k -= 1
#   end

#   result
# end

# def max_array(array, k)
#   return [array.max] if k == 1

#   new_array = array.slice(0, array.size)

#   while new_array.size > k
#     i = 0
#     while i < new_array.size - 1
#       if new_array[i] < new_array[i + 1]
#         new_array.delete_at(i)
#         break
#       end
#       i += 1
#     end

#     if (i == new_array.size - 1) && new_array.size > k
#       if new_array[i - 1] < new_array[i]
#         new_array.delete_at(i - 1)
#       else
#         new_array.delete_at(i)
#       end
#     end
#   end

#   new_array
# end

# Optimize max array
def max_array(array, k)
  n = array.size
  k = n - k

  return [] if k >= n

  result = []

  array.each do |num|
    while k!= 0 && !result.empty? && result.last < num
      result.pop
      k -= 1
    end
    result << num
  end
  
  while !result.empty? && k > 0
    result.pop
    k -= 1
  end

  return result
end

def compare(a1, i, a2, j)
  while i < a1.size && j < a2.size && a1[i] == a2[j]
    i += 1
    j += 1
  end

  return true if j == a2.size
  return true if i < a1.size && a1[i] > a2[j]

  false
end

def merge(a1, a2, k)
  res = Array.new(k, 0)
  i = 0
  j = 0

  res.each_with_index do |_, r|
    if compare(a1, i, a2, j)
      res[r] = a1[i] || 0
      i += 1
    else
      res[r] = a2[j] || 0
      j += 1
    end
  end

  res
end

def max_number(nums1, nums2, k)
  s1 = nums1.size
  s2 = nums2.size

  result = Array.new(k, 0)

  partrition_1 = [0, k - s2].max
  partrition_2 = [k, s1].min

  index = partrition_1

  while index >= partrition_1 && index <= partrition_2
    max_array1 = max_array(nums1, index)
    max_array2 = max_array(nums2, k - index)

    temp = merge(max_array1, max_array2, k)
    result = temp if (compare(temp, 0, result, 0))

    index += 1
  end

  result
end

## Copy that below the result inside while block of max_number for debugging
# puts
# p "A1 quanity: #{index}"
# p "A2 quanity: #{k - index}"
# p "Max A1:     #{max_array1}"
# p "Max A2:     #{max_array2}"
# p "Temp:       #{temp}"
# p "Result:     #{result}"
# puts

# p 'Test merge array'
# a1 = [9, 8, 5]
# a2 = [9, 7]
# k  = 5
# p "Merge Array: #{merge(a1, a2, k)}"

# puts 'Test 1'
# nums1 = [3, 4, 6, 5]
# nums2 = [9, 1, 2, 5, 8, 3]
# k = 5
# puts "nums1 = #{nums1.inspect}"
# puts "nums2 = #{nums2.inspect}"
# puts "k = #{k}"
# puts
# result = max_number(nums1, nums2, k)
# puts "Result = #{result.inspect}"
# puts "nums1 = #{nums1.inspect}"

# puts 'Test 2'
# nums1 = [6, 7]
# nums2 = [6, 0, 4]
# k = 5
# puts "nums1 = #{nums1.inspect}"
# puts "nums2 = #{nums2.inspect}"
# puts "k = #{k}"
# result = max_number(nums1, nums2, k)
# puts "Result = #{result.inspect}"

# puts 'Test 3'
# nums1 = [3, 9]
# nums2 = [8, 9]
# k = 3
# puts "nums1 = #{nums1.inspect}"
# puts "nums2 = #{nums2.inspect}"
# puts "k = #{k}"
# result = max_number(nums1, nums2, k)
# puts "Result = #{result.inspect}"

# puts 'Test 4'
# nums1 = [8, 6, 9]
# nums2 = [1, 7, 5]
# k = 3
# puts "nums1 = #{nums1.inspect}"
# puts "nums2 = #{nums2.inspect}"
# puts "k = #{k}"
# result = max_number(nums1, nums2, k)
# puts "Result = #{result.inspect}"

# puts 'Test 5'
# nums1 = [6, 6, 8]
# nums2 = [5, 0, 9]
# k = 3
# puts "nums1 = #{nums1.inspect}"
# puts "nums2 = #{nums2.inspect}"
# puts "k = #{k}"
# result = max_number(nums1, nums2, k)
# puts "Result = #{result.inspect}"

# puts 'Test 6'
# nums1 = [3, 8, 5, 3, 4]
# nums2 = [8, 7, 3, 6, 8]
# k = 5
# puts "nums1 = #{nums1.inspect}"
# puts "nums2 = #{nums2.inspect}"
# puts "k = #{k}"
# result = max_number(nums1, nums2, k)
# puts "Result = #{result.inspect}"

# array = [8, 7, 3, 6, 1, 0, 8]
# puts max_array(array, 2).inspect
# array = [8, 7, 6, 5, 4, 3, 4, 5, 6, 7, 8]
# puts max_array(array, 2).inspect