def tuple_same_product(nums)
    product_count = Hash.new(0)
    n = nums.length

    # Generate all pairs and count the frequency of each product
    (0...n).each do |i|
        (i+1...n).each do |j|
            product = nums[i] * nums[j]
            product_count[product] += 1
        end
    end

    # Calculate the number of valid tuples
    result = 0
    product_count.each do |product, count|
        if count >= 2
            # The number of ways to choose 2 pairs from `count` pairs is C(count, 2)
            # Each pair can form a tuple with any other pair
            result += count * (count - 1) * 4
        end
    end

    result
end

