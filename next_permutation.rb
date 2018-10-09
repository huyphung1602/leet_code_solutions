# Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

# If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

# The replacement must be in-place and use only constant extra memory.

# Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

# 1,2,3 → 1,3,2
# 3,2,1 → 1,2,3
# 1,1,5 → 1,5,1

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def swap_num(array, p1, p2)
  array[p1], array[p2] = array[p2], array[p1]
end

def mutable_reverse_from_start(array, start)
  size = array.size - 1

  return if size == start

  mid =  (size - start)/ 2 + 1

  array.reverse_each.with_index do |num, index|
    break if index == mid
    swap_num(array, size - index, start + index)
  end
end

def next_permutation(nums)
  max_index = nums.size - 1
  first_position = max_index
  second_position = max_index
  possible = false

  nums.reverse_each do |num|
    break if first_position == 0

    if num > nums[first_position - 1]
      first_position -= 1
      possible = true
      break
    else

      first_position -= 1
    end
  end

  if possible
    nums.reverse_each do |num|
      if nums[first_position] < nums[second_position]
        swap_num(nums, first_position, second_position)
        break
      end

      second_position -= 1
    end

    mutable_reverse_from_start(nums, first_position + 1)
  else
    mutable_reverse_from_start(nums, first_position)
  end

  nums
end

array = [1, 2, 3]
puts "Array #{array}"
puts "Next permutation: #{next_permutation(array).inspect}"

array = [3, 2, 1]
puts "Array #{array}"
puts "Next permutation: #{next_permutation(array).inspect}"

array = [1, 1, 5]
puts "Array #{array}"
puts "Next permutation: #{next_permutation(array).inspect}"

array = [1, 3, 2]
puts "Array #{array}"
puts "Next permutation: #{next_permutation(array).inspect}"
