# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

# # Plus string
# def sum_list(list)
#   sum = list.val.to_s

#   until list.next.nil?
#     list = list.next
#     sum += list.val.to_s
#   end

#   sum.reverse.to_i
# end

# def add_two_numbers(l1, l2)
#   sum = sum_list(l1) + sum_list(l2)
#   sum = sum.to_s.reverse

#   root_list = nil
#   list = nil

#   sum.chars.each do |char|
#     if list
#       list.next = ListNode.new(char.to_i)
#       list = list.next
#     else
#       root_list = ListNode.new(char.to_i)
#       list = root_list
#     end
#   end

#   root_list
# end

# Optimize to avoid reverse the string
def sum_list(list)
  sum = 0
  count = 0

  until list.nil?
    sum += list.val * 10**count
    count += 1
    list = list.next
  end

  sum
end

def add_two_numbers(l1, l2)
  sum = sum_list(l1) + sum_list(l2)
  divider = 10 ** (sum.to_s.size - 1)

  return ListNode.new(sum) if divider == 1

  list = nil
  previous_list = nil

  until divider < 1
    value = sum / divider
    sum = sum % divider
    divider /= 10

    if previous_list
      list = ListNode.new(value)
      list.next = previous_list
      previous_list = list
    else
      previous_list = ListNode.new(value)
    end
  end

  list
end


list_1 = ListNode.new(2)
list_1.next = ListNode.new(4)
list_1.next.next = ListNode.new(3)

list_2 = ListNode.new(5)
list_2.next = ListNode.new(6)
list_2.next.next = ListNode.new(4)

puts list_1.inspect
puts sum_list(list_1)

puts list_2.inspect
puts sum_list(list_2)

puts add_two_numbers(list_1, list_2).inspect
