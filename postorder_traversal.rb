# Given a binary tree, return the postorder traversal of its nodes' values.

# Example:

# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3

# Output: [3,2,1]
# Follow up: Recursive solution is trivial, could you do it iteratively?

# Recursive way
def postorder_traversal(root, array = [])
  array.tap do |a|

    unless root.left.nil?
      preorder_traversal(root.left, a)
    end

    unless root.right.nil?
      preorder_traversal(root.right, a)
    end

    a << root.val unless root.nil?
  end
end

# Iterative way - Using two stacks. O(h) run time, O(n) space
def postorder_traversal(root)
  return [] if root.nil?

  stack_1 = [root]
  stack_2 = []

  until stack_1.empty?
    current_node = stack_1.pop

    stack_2 << current_node.val
    stack_1 << current_node.left unless current_node.left.nil?
    stack_1 << current_node.right unless current_node.right.nil?
  end

  stack_2.reverse
end

# Iterative way - Using one stack. O(h) run time, O(n) space

# iterative 1 stack
def postorder_traversal(root)
  result = []
  return result if root.nil?

  stack = []
  stack << root.right if root.right
  stack << root
  root = root.left

  until stack.empty?
    unless root.nil?
      stack << root.right if root.right
      stack << root
      root = root.left
    else
      root = stack.pop

      if root.right && root.right == stack.last
        stack.pop
        stack << root
        root = root.right
      else
        result << root.val
        root = nil
      end
    end
  end

  result
end
