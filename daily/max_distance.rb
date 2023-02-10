# @param {Integer[][]} grid
# @return {Integer}
def max_distance(grid)
  n = grid.size - 1

  queue = []
  i = 0

  while i <= n
    j = 0

    while j <= n
      queue << [i, j, 0] if grid[i][j] == 1
      j += 1
    end

    i += 1
  end

  return -1 if [0, (n + 1) * (n + 1)].include?(queue.size)

  current_distance = 0

  while (i, j, distance = queue.shift)
    current_distance = distance
    grid[i][j] = 3

    add_to_queue(grid, i - 1, j, distance + 1, queue) if i > 0 && grid[i - 1][j] == 0
    add_to_queue(grid, i + 1, j, distance + 1, queue) if i < n && grid[i + 1][j] == 0
    add_to_queue(grid, i, j - 1, distance + 1, queue) if j > 0 && grid[i][j - 1] == 0
    add_to_queue(grid, i, j + 1, distance + 1, queue) if j < n && grid[i][j + 1] == 0
  end

  current_distance
end

def add_to_queue(grid, i, j, distance, queue)
  grid[i][j] = 2
  queue << [i, j, distance]
end
