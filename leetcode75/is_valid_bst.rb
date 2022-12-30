# https://leetcode.com/problems/validate-binary-search-tree/?envType=study-plan&id=level-1

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
# @return {Boolean}
def is_valid_bst(root)
  def validate(node, low = -Float::INFINITY, high = Float::INFINITY)
    return true unless node
    return false if node.val <= low || node.val >= high

    validate(node.right, node.val, high) && validate(node.left, low, node.val)
  end

  validate(root)
end