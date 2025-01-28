# @param {Integer[][]} grid
# @return {Integer}
def find_max_fish(grid)
  return 0 if grid.empty? || grid[0].empty?

  m, n = grid.size, grid[0].size
  visited = Array.new(m) { Array.new(n, false) }
  max_fish = 0

  # Directions for adjacent cells (right, left, down, up)
  directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  # Helper function for DFS
  def dfs(grid, r, c, visited, directions)
    return 0 if r < 0 || c < 0 || r >= grid.size || c >= grid[0].size || visited[r][c] || grid[r][c] == 0

    visited[r][c] = true
    fish_count = grid[r][c]

    directions.each do |dr, dc|
      fish_count += dfs(grid, r + dr, c + dc, visited, directions)
    end

    fish_count
  end

  # Iterate through each cell in the grid
  (0...m).each do |r|
    (0...n).each do |c|
      if grid[r][c] > 0 && !visited[r][c]
        max_fish = [max_fish, dfs(grid, r, c, visited, directions)].max
      end
    end
  end

  max_fish
end
