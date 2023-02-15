# @param {Integer[]} num
# @param {Integer} k
# @return {Integer[]}
def add_to_array_form(num, k)
  i = 0

  while k != 0 do
    p = num.size - 1 - i

    if p < 0
      num.unshift(0)
      p = 0
    end

    num[p] += k % 10
    k = k / 10 + num[p] / 10
    num[p] = num[p] % 10
    i += 1
  end

  num
end
