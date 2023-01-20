# https://leetcode.com/problems/non-decreasing-subsequences/description/

def find_subsequences(nums)
    @results = Set.new
    
    find_sequence(nums, [])
    
    @results.to_a
end

def find_sequence(nums, current)
    return if @results.include?(current)
    @results.add(current) if current.length >= 2
    return if nums.empty?
    
    nums.each_with_index do |num, index|
        next if current.any? && num < current[-1]
        find_sequence(nums[index+1..-1], current + [num])
    end
end
