# URL: https://leetcode.com/problems/add-one-row-to-tree/
#
# Definition for a binary tree node.
#
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#       @val = val
#       @left = left
#       @right = right
#   end
# end
# @param {TreeNode} root
# @param {Integer} val
# @param {Integer} depth
# @return {TreeNode}
def add_one_row(root, val, depth)
  return TreeNode.new(val, root, nil) unless depth > 1
  head = root
  walker(root, 0, depth, val)
  head
end

def add_nodes(left, right, val)
  new_left = TreeNode.new(val, left, nil)
  new_right = TreeNode.new(val, nil, right)
  [new_left, new_right]
end

def walker(root, counter, depth, val)
  if root && counter < depth
    counter += 1

    root.left, root.right = add_nodes(root.left, root.right, val) if counter == depth - 1
    return if counter >= depth
    walker(root.left, counter, depth, val)
    walker(root.right, counter, depth, val)
  end
end

# Summary for my solution above here:
# Solution using recursion to traverse the tree and add new nodes at the desired depth.
# The walker function recursively visits each node in the tree and when the depth is reached, it adds the new nodes and returns.
# The add_nodes function creates the new nodes and returns them as a pair.
# The head variable is used to return the new head of the tree, which is the original root or the new root if the depth is 2.

# Tóm tắt cho giải pháp của tôi trên đây đây là:
# Giải pháp sử dụng đệ quy để duyệt cây và thêm các nút mới tại mức được chỉ định.
# Hàm walker được gọi đệ quy để duyệt qua từng nút trong cây. Khi đến mức được chỉ định, nó sẽ thêm các nút mới và trả về.
# Hàm add_nodes tạo ra các nút mới và trả về chúng dưới dạng một cặp.
# Biến head được sử dụng để trả về phần tử mới của cây, có thể là gốc gốc ban đầu hoặc gốc mới nếu mức độ là 2.
