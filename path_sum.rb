# Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

# Note: A leaf is a node with no children.

# Example:

# Given the below binary tree and sum = 22,

#       5
#      / \
#     4   8
#    /   / \
#   11  13  4
#  /  \      \
# 7    2      1
# return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.

# Recursive way
def has_path_sum(root, sum)
  return false if root.nil?

  sum -= root.val
  return true if sum == 0 && root.left.nil? && root.right.nil?


  left_result = false
  right_result = false

  if root.left
    left_result = has_path_sum(root.left, sum)
  end

  if root.right
    right_result = has_path_sum(root.right, sum)
  end

  left_result || right_result
end
