# Serialize and Deserialize Binary Tree
#   Go to Discuss
# Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

# Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

# Example: 

# You may serialize the following tree:

#     1
#    / \
#   2   3
#      / \
#     4   5

# as "[1,2,3,null,null,4,5]"
# Clarification: The above format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

# Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.


# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

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

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}

# Use preorder traversal, marker the null value as '#', convert the array to string
def serialize(root)
  return 'nil' if root.nil?

  result = []
  node_stack = []
  node_stack << root

  until node_stack.empty?
    current_node = node_stack.pop

    if current_node.nil?
      result << '#'
    else
      result << current_node.val
      node_stack << current_node.right
      node_stack << current_node.left
    end
  end

  result.join(', ')
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}

def decode(values, index)
  value = values[index.value]
  index.value += 1

  return if value.nil? || value == '#'
  puts value

  root = TreeNode.new(value.to_i)
  root.left = decode(values, index)
  root.right = decode(values, index)

  root
end

Struct.new('Index', :value)

def deserialize(data)
  return nil if data == 'nil'
  index = Struct::Index.new(0)

  values = data.split(', ')

  return decode(values, index)
end

# preorder = [1, 2, 3, 4, 5]
# inorder  = [2, 1, 4, 3, 5]

preorder = [3, 5, 6, 2, 7, 4, 1, 0, 8]
inorder  = [6, 5, 7, 2, 4, 3, 0, 1, 8]

tree = build_tree(preorder, inorder)
data = serialize(tree)
puts data
puts deserialize(data).inspect
