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
# @return {Integer}
def sum_numbers(root)
  dfs(root)
end

def dfs(root, sum = 0)
  return 0 if root.nil?
  sum = sum * 10 + root.val
  return sum if root.left.nil? && root.right.nil?

  dfs(root.left, sum) + dfs(root.right, sum)
end
