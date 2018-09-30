# Question:
# Design and implement a TwoSum class. It should support the following operations: add and find.
# add(input) – Add the number input to an internal data structure.
# find(value) – Find if there exists any pair of numbers which sum is equal to the value.
# For example,
# add(1); add(3); add(5); find(4) -> true; find(7) -> false

# This method is useful if the number of find operations far exceeds the number of add operations.

## add – O(1) runtime, find – O(n log n) runtime, O(n) space – Sort + Two pointers:

class TwoSum
  class << self
    def add(value)
      array << value
    end

    def find(total_value)
      sorted_array = array.sort

      l_pointer = 0
      r_pointer = sorted_array.size - 1

      while l_pointer < r_pointer
        sum = sorted_array[l_pointer] + sorted_array[r_pointer]

        if sum < total_value
          l_pointer += 1
        elsif sum > total_value
          r_pointer -= 1
        else
          return true
        end
      end

      false
    end

    def array
      @@array
    end

    private

    @@array = []
  end
end

# Run the first solution
TwoSum.add(1)
TwoSum.add(1)
TwoSum.add(2)
TwoSum.add(3)
puts TwoSum.array.inspect
puts 'Find 5'
puts TwoSum.find(5)
puts 'Find 2'
puts TwoSum.find(2)
puts 'Find 7'
puts TwoSum.find(7)
