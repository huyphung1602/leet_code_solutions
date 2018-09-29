# Similar to Question [1. Two Sum], except that the input array is already sorted in ascending order.

# Of course we could still apply the [Hash table] approach, but it costs us O(n) extra space, plus it does not make use of the fact that the input is already sorted.

# Binary search
def binary_search(array, key, start_position)
  left = start_position
  right = array.size - 1

  while left < right
    mid = (left + right) / 2

    if array[mid] < key
      left = mid + 1
    else
      right = mid
    end
  end

  (left == right && array[left] == key) ? left : -1
end

# Implement two_sum with binary_search. O(n log n) runtime, O(1) space
def two_sum_binary(numbers, target)
  numbers.each_with_index do |num, i|
    j = binary_search(numbers, target - num, i+1)

    # +1 because we do both index1 and index2 are not zero-based
    return [i+1, j+1] unless j == -1
  end

  raise ArgumentError.new("No two sum solution")
end
