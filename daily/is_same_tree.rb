# https://leetcode.com/problems/same-tree/

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

node_2 = TreeNode.new(-5, nil, nil)
node_1 = TreeNode.new(-8, nil, nil)
p = TreeNode.new(3, node_2)
q = TreeNode.new(3, node_1)

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  return true if p.nil? && q.nil?

  return false if p.nil? || q.nil?

  return false if p.val != q.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

p is_same_tree(p, q)