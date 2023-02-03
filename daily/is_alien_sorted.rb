# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  order_hash = {}
  order_hash[nil] = 100 # fix value
  order.chars.each_with_index do |o, i|
    order_hash[o] = order.length - i
  end

  define_method(:valid?) do |c1, c2|
    0.upto([c1.length, c2.length].max - 1) do |i|
      next if c1[i] == c2[i]
      p "c2[i]: #{c2[i]}, #{order_hash[c2[i]]}"
      p "c1[i]: #{c1[i]}, #{order_hash[c1[i]]}"
      return order_hash[c2[i]] < order_hash[c1[i]]
    end
  end

  0.upto(words.length - 2) do |i|
    j = i + 1
    return false unless valid?(words[i], words[j])
  end

  true
end

words = ["word","world","row"]
order = "worldabcefghijkmnpqstuvxyz"
p is_alien_sorted words, order
