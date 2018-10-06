# Lowest Common Ancestor of a Binary Tree
#   Go to Discuss
# Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

# According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

# Given the following binary tree:  root = [3,5,1,6,2,0,8,null,null,7,4]

#         _______3______
#        /              \
#     ___5__          ___1__
#    /      \        /      \
#    6      _2       0       8
#          /  \
#          7   4
# Example 1:

# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
# Output: 3
# Explanation: The LCA of of nodes 5 and 1 is 3.
# Example 2:

# Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
# Output: 5
# Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself
#              according to the LCA definition.
# Note:

# All of the nodes' values will be unique.
# p and q are different and both values will exist in the binary tree.

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
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

def has_path(root, key, path = [])
  return false if root.nil?

  path << root.val

  return true if root.val == key
  return true if has_path(root.left, key, path) || has_path(root.right, key, path)

  path = path.pop
  return false
end

def lowest_common_ancestor(root, p, q)
  return false if root.nil?

  path_1 = []
  has_path(root, p, path_1)

  path_2 = []
  has_path(root, q, path_2)

  ancestor = nil

  path_1.each_with_index do |value, index|
    break if value != path_2[index]
    ancestor = value
  end

  ancestor
end

preorder = [3, 5, 6, 2, 7, 4, 1, 0, 8]
inorder  = [6, 5, 7, 2, 4, 3, 0, 1, 8]

tree = build_tree(preorder, inorder)


# # Run this to understand has_path
# path = []
# has_path(tree, 5, path)
# puts path.inspect

# path = []
# has_path(tree, 4, path)
# puts path.inspect

# path = []
# has_path(tree, 5, path)
# puts path.inspect

# path = []
# has_path(tree, 8, path)
# puts path.inspect


puts lowest_common_ancestor(tree, 5, 4)
puts lowest_common_ancestor(tree, 5, 8)
puts lowest_common_ancestor(tree, 2, 6)
puts lowest_common_ancestor(tree, 5, 1)
puts lowest_common_ancestor(tree, 6, 2)
puts lowest_common_ancestor(tree, 4, 5)
