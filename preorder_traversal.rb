# Given a binary tree, return the preorder traversal of its nodes' values.

# Example:

# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3

# Output: [1,2,3]
# Follow up: Recursive solution is trivial, could you do it iteratively?

# Recursive way
def preorder_traversal(root, array = [])
  array.tap do |a|
    a << root.val unless root.nil?

    unless root.left.nil?
      preorder_traversal(root.left, a)
    end

    unless root.right.nil?
      preorder_traversal(root.right, a)
    end
  end
end

# Iterative way
def preorder_traversal(root)
  result = []
  return result if root.nil?

  node_stack = []
  node_stack << root

  until node_stack.empty?
    current_node = node_stack.pop

    result << current_node.val

    unless current_node.right.nil?
      node_stack << current_node.right
    end

    unless current_node.left.nil?
      node_stack << current_node.left
    end
  end

  result
end
