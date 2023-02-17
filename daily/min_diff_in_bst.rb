def min(a, b) = a < b ? a : b
def max(a, b) = a > b ? a : b

def deep(root)
  if root
    l, r = [root.left, root.right].map { deep _1 }

    { min_diff: [root.val - l[:max], r[:min] - root.val, l[:min_diff], r[:min_diff]].min,
      min: min(l[:min], root.val),
      max: max(r[:max], root.val) }
  else
    ∞ = Float::INFINITY

    { min_diff: ∞, min: ∞, max: -∞ }
  end
end

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
def min_diff_in_bst(root) = deep(root)[:min_diff]
  
