def longest_monotonic_subarray(nums)
  return 0 if nums.empty?
  return 1 if nums.size == 1

  max_len = 1
  current_inc = 1
  current_dec = 1

  (1...nums.size).each do |i|
    if nums[i] > nums[i-1]
      new_inc = current_inc + 1
      new_dec = 1
    elsif nums[i] < nums[i-1]
      new_dec = current_dec + 1
      new_inc = 1
    else
      new_inc = 1
      new_dec = 1
    end

    current_inc = new_inc
    current_dec = new_dec

    current_max = [current_inc, current_dec].max
    max_len = [max_len, current_max].max
  end

  max_len
end

