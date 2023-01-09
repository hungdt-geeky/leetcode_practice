# https://leetcode.com/problems/binary-tree-preorder-traversal/solutions/?languageTags=ruby

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root, result = [])
  return result if root.nil?
  result << root.val
  preorder_traversal(root.left, result)
  preorder_traversal(root.right, result)
  result
end