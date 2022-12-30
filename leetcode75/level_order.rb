# https://leetcode.com/problems/binary-tree-level-order-traversal/description/?envType=study-plan&id=level-1

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
# @return {Integer[][]}
def level_order(root)
  return [] unless root
  queue, result = [root], []
  while queue.size > 0
    result << queue.map(&:val)
    queue = queue.map { |node| [node.left, node.right] }.flatten.compact   # Can this assignment be omitted?
  end
  result
end

# @result = []
# def level_order(root)
#     @result = []
#     level(root, 0)
#     @result
# end
#
# def level(node, depth)
#   return if node.nil?
#
#   @result[depth] ||= []
#
#   @result[depth].push(node.val)
#
#   level(node.left, depth+1)
#   level(node.right, depth+1)
# end