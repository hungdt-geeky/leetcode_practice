# @param {String[]} words
# @return {String[]}
def find_all_concatenated_words_in_a_dict(words)
  dictionary = Set.new(words)
  answer = []
  words.each do |word|
    length = word.length
    dp = Array.new(length + 1, false)
    dp[0] = true
    (1..length).each do |i|
      ((i == length ? 1 : 0)..i - 1).each do |j|
        dp[i] ||= dp[j] && dictionary.include?(word[j...i])
      end
    end
    answer << word if dp[length]
  end

  answer
end