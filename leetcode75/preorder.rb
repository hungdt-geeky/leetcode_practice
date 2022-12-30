# https://leetcode.com/problems/n-ary-tree-preorder-traversal/?envType=study-plan&id=level-1

# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  @result = []
  dfs(root)
  @result
end

def dfs(node)
  return unless node
  @result << node.val

  node.children.each do |child|
    dfs(child)
  end
end