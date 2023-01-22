# @param {String} s
# @return {String[][]}
def partition(s)
  @result = []
  dfs(s, [])
  @result
end

def dfs(s, result_partition)
  if s.empty?
    @result << result_partition.dup
    return
  end

  (1..s.length).each do |i|
    prefix = s[0...i]
    postfix = s[i..-1]

    if prefix == prefix.reverse
      result_partition << prefix
      dfs(postfix, result_partition)
      result_partition.pop
    end
  end
end

p partition("abbc")