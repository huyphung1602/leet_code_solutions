# Given inorder and postorder traversal of a tree, construct the binary tree.

# Note:
# You may assume that duplicates do not exist in the tree.

# For example, given

# inorder = [9,3,15,20,7]
# postorder = [9,15,7,20,3]
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

# The last node of post always the root of the tree
# Search 3 in inorder to find left and right subtrees of the root, left of 3 is left subtree, right of 3 is right subtree

def build_tree(inorder, postorder)
  return [] if postorder.empty?

  root_val = postorder.pop

  node = TreeNode.new(root_val)

  root_position = inorder.index(root_val)

  left_inorder = inorder.slice(0, root_position)
  left_postorder = postorder.slice(0, root_position)

  right_inorder = inorder.slice(root_position + 1, inorder.size)
  right_postorder = postorder.slice(root_position, postorder.size)

  unless left_postorder.empty?
    node.left = build_tree(left_inorder, left_postorder)
  end

  unless right_postorder.empty?
    node.right = build_tree(right_inorder, right_postorder)
  end

  node
end

inorder = [9, 3, 15, 20, 7]
postorder = [9, 15, 7, 20, 3]

# build_tree(inorder, postorder)
puts build_tree(inorder, postorder).inspect
