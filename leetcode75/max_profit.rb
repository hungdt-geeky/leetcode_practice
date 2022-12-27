# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/?envType=study-plan&id=level-1

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    min_price = Float::INFINITY
    max_profit = 0

    prices.each do |price|
        min_price = [min_price, price].min
        max_profit = [max_profit, price - min_price].max
    end

    max_profit
end