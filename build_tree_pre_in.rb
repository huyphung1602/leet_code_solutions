# Given preorder and inorder traversal of a tree, construct the binary tree.

# Note:
# You may assume that duplicates do not exist in the tree.

# For example, given

# preorder = [3,9,20,15,7]
# inorder = [9,3,15,20,7]
# Return the following binary tree:

#     3
#    / \
#   9  20
#     /  \
#    15   7

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}


def build_tree(preorder, inorder)
  return [] if preorder.empty?

  root_val = preorder.shift
  root_position = inorder.index(root_val)

  node = TreeNode.new(root_val)

  left_preorder = preorder.slice(0, root_position)
  left_inorder = inorder.slice(0, root_position)

  right_preorder = preorder.slice(root_position, preorder.size)
  right_inorder = inorder.slice(root_position + 1, inorder.size)

  unless left_preorder.empty?
    node.left = build_tree(left_preorder, left_inorder)
  end

  unless right_preorder.empty?
    node.right = build_tree(right_preorder, right_inorder)
  end

  node
end


preorder = [3,9,20,15,7]
inorder = [9,3,15,20,7]

puts build_tree(preorder, inorder).inspect
