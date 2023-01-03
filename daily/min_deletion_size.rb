# https://leetcode.com/problems/delete-columns-to-make-sorted/

# @param {String[]} strs
# @return {Integer}
def min_deletion_size(strs)
  max_size = strs[0].length
  check = {}
  temp = max_size
  0.upto(max_size - 1) do |i|
    check[i] = true
    j = 1
    while j < strs.length
      if strs[j - 1][i] > strs[j][i]
        check[i] = false
        temp -= 1
        break
      end
      j += 1
    end
  end

  max_size - temp
end

strs = ["cba","daf","ghi"]
min_deletion_size(strs)
