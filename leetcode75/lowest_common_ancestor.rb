# https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/solutions/?envType=study-plan&id=level-1

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  if root.val > p.val && root.val > q.val
    lowest_common_ancestor(root.left, p, q)
  elsif root.val < p.val && root.val < q.val
    lowest_common_ancestor(root.right, p, q)
  else
    root
  end
end