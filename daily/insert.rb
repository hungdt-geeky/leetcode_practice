# https://leetcode.com/problems/insert-interval/

# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  merged = []
  intervals.each_with_index do |interval, index|
    if interval[-1] < new_interval[0]
      merged << interval
    elsif new_interval[-1] < interval[0]
      merged << new_interval unless merged[-1] == new_interval
      return merged + intervals[index..intervals.length]
    else
      new_interval = merge_intervals(interval, new_interval)
    end
  end

  merged << new_interval
end

def overlapping_intervals?(interval, other_interval)
  ([interval[1], other_interval[1]].min - [interval[0], other_interval[0]].max) >= 0
end

def merge_intervals(interval, other_interval)
  if overlapping_intervals?(interval, other_interval)
    [[interval[0], other_interval[0]].min, [interval[1], other_interval[1]].max]
  else
    [interval[0], interval[1]]
  end
end
#
# def insert_interval(intervals, new_interval)
#   interval_inserted = false
#   array = intervals
#
#   intervals.each_with_index do |interval, index|
#     if new_interval[0] < interval[0]
#       interval_inserted = true
#       array.insert(index, new_interval)
#       break
#     end
#   end
#
#   array.push(new_interval) unless interval_inserted
#
#   array
# end

# intervals = [[1, 2], [1, 5], [6, 7], [8, 10], [12, 16]]
# new_interval = [20, 23]

# p merge_intervals([2, 5], [1, 4])
# insert(intervals, new_interval)
# p insert_interval(intervals, new_interval)


