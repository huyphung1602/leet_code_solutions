# Given a binary tree, return the inorder traversal of its nodes' values.

# Example:

# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3

# Output: [1,3,2]
# Follow up: Recursive solution is trivial, could you do it iteratively?

# Recursive way
def inorder_traversal(root, array = [])
  array.tap do |a|

    unless root.left.nil?
      preorder_traversal(root.left, a)
    end

    a << root.val unless root.nil?

    unless root.right.nil?
      preorder_traversal(root.right, a)
    end
  end
end

# 1) Create an empty stack S.
# 2) Initialize current node as root
# 3) Push the current node to S and set current = current->left until current is NULL
# 4) If current is NULL and stack is not empty then
#      a) Pop the top item from stack.
#      b) Print the popped item, set current = popped_item->right
#      c) Go to step 3.
# 5) If current is NULL and stack is empty then we are done.

# Iterative way
def inorder_traversal(root)
  result = []
  return result if root.nil?

  current_node = root
  stack = []
  done = 0

  while done == 0
    unless current_node.nil?
      stack << current_node
      current_node = current_node.left
    else
      unless stack.empty?
        current_node = stack.pop
        result << current_node.val
        current_node = current_node.right
      else
        done = 1
      end
    end
  end

  result
end
