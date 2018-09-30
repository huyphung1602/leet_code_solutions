# Question:
# Design and implement a TwoSum class. It should support the following operations: add and find.
# add(input) – Add the number input to an internal data structure.
# find(value) – Find if there exists any pair of numbers which sum is equal to the value.
# For example,
# add(1); add(3); add(5); find(4) -> true; find(7) -> false

# This method is useful if the number of find operations far exceeds the number of add operations.

## add – O(1) runtime, find – O(n) runtime, O(n) space – Store input in hash table:

class TwoSum
  class << self
    def add(value)
      if hash_table[value].nil?
        hash_table[value] = 1
      else
        hash_table[value] += 1
      end
    end

    def find(total_value)
      hash_table.each do |value, count|
        remain_value = total_value - value
        if remain_value == value
          return true if count >= 2
        else
          return true unless hash_table[remain_value].nil?
        end
      end

      false
    end

    def hash_table
      @@hash_map
    end

    private

    @@hash_map = {}
  end
end

# Run the first solution
TwoSum.add(1)
TwoSum.add(1)
TwoSum.add(2)
TwoSum.add(3)
puts TwoSum.hash_table.inspect
puts 'Find 5'
puts TwoSum.find(5)
puts 'Find 2'
puts TwoSum.find(2)
puts 'Find 7'
puts TwoSum.find(7)
