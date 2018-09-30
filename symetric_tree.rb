# Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

#     1
#    / \
#   2   2
#  / \ / \
# 3  4 4  3
# But the following [1,2,2,null,3,null,3] is not:
#     1
#    / \
#   2   2
#    \   \
#    3    3
# Note:
# Bonus points if you could solve it both recursively and iteratively.

# [1, 2, 2, 3, 4, 4, 3]

# 0 -> 2*0+2 = 2 swap here


def is_mirror(root_1, root_2)
  if root_1.nil? && root_2.nil?
    return true
  end

  # Miror mean left == right and right = left
  if !root_1.nil?  && !root_2.nil?
    if root_1.val == root_2.val
      return is_mirror(root_1.left, root_2.right) && is_mirror(root_1.right, root_2.left)
    end
  end

  false
end


#$ Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

tree_node_1 = TreeNode.new(3)
tree_node_2 = TreeNode.new(4)

tree_node_right = TreeNode.new(2)
tree_node_right.left = tree_node_2
tree_node_right.right = tree_node_1

tree_node_left = TreeNode.new(2)
tree_node_left.left = tree_node_1
tree_node_left.right = tree_node_2

root = TreeNode.new(1)
root.left = tree_node_left
root.right = tree_node_right

puts is_mirror(root.left, root.right)
