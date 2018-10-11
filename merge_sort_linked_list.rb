# Sort a linked list in O(n log n) time using constant space complexity.

# Example 1:

# Input: 4->2->1->3
# Output: 1->2->3->4
# Example 2:

# Input: -1->5->3->4->0
# Output: -1->0->3->4->5

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
      @val = val
      @next = nil
  end
end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end 
  
  def insert(value)
    new_node = ListNode.new(value)
    if !@head
      @head = new_node
      @tail = new_node
    else 
      @tail.next = new_node
      @tail = new_node
    end 
  end 
end

def print_list(head)
  return head ? "#{head.val} -> #{print_list(head.next)}" : 'n'
end 

def get_middle(node)
  return node unless node

  fast_pointer = node.next
  slow_pointer = node

  until fast_pointer.nil?
    fast_pointer = fast_pointer.next

    unless fast_pointer.nil?
      fast_pointer = fast_pointer.next
      slow_pointer = slow_pointer.next
    end
  end

  slow_pointer
end

def sorted_merge(node_a, node_b)
  result = nil

  return node_a if node_b.nil?
  return node_b if node_a.nil?

  if node_a.val <= node_b.val
    result = node_a
    result.next = sorted_merge(node_a.next, node_b)
  else
    result = node_b
    result.next = sorted_merge(node_a, node_b.next)
  end

  result
end

# @param {ListNode} head
# @return {ListNode}
def sort_list(head)
  return head unless head
  return head unless head.next

  middle = get_middle(head)
  next_to_middle = middle.next

  middle.next = nil

  left = sort_list(head)
  right = sort_list(next_to_middle)

  sorted_merge(left, right)
end

list = LinkedList.new
list.insert(4)
list.insert(7)
list.insert(3)
list.insert(10)
list.insert(1)
list.insert(9)
list.insert(17)

puts 'List 1'
puts print_list(list.head)

puts 'Test middle of list 1'
puts print_list(sort_list(list.head))
