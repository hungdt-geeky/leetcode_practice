# @param {Integer} n
# @return {Integer}
# def tribonacci(n)
#   return 0 if n == 0
#   return 1 if n == 1 || n == 2
#
#   tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
# end
#
# @param {Integer} n
# @return {Integer}
def tribonacci(n)
  cache = {
    0 => 0,
    1 => 1,
    2 => 1,
  }

  def tribonacci_helper(n, cache)
    if cache[n]
      cache[n]
    else
      cache[n] = tribonacci_helper((n - 3), cache) + tribonacci_helper((n - 2), cache) + tribonacci_helper((n - 1), cache)
    end
  end

  tribonacci_helper(n, cache)
end

p tribonacci 37