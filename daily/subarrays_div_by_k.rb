# https://leetcode.com/problems/subarray-sums-divisible-by-k/description/

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def prefs(a) = [st = 0] + a.map { st += _1 }

def subarrays_div_by_k(nums, k)
  modulo_freqs = Hash.new(0)
  prefs(nums).each { modulo_freqs[_1 % k] += 1 }
  modulo_freqs.sum { _2 * (_2 - 1) / 2 }
end