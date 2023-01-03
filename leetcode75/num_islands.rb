# https://leetcode.com/problems/number-of-islands/?envType=study-plan&id=level-1

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  # Initialize the number of islands to 0
  islands = 0

  # Iterate through each cell in the grid
  (0...grid.length).each do |i|
    (0...grid[0].length).each do |j|
      # If the current cell is land, perform a depth-first search to mark all connected land cells as visited
      # and increment the number of islands
      if grid[i][j] == "1"
        dfs(grid, i, j)
        islands += 1
      end
    end
  end

  # Return the number of islands
  islands
end

def dfs(grid, i, j)
  # Return if the current cell is out of bounds or is water
  return if i < 0 || i >= grid.length || j < 0 || j >= grid[0].length || grid[i][j] == "0"

  # Mark the current cell as visited
  grid[i][j] = "0"

  # Perform a depth-first search on the 4-connected cells
  dfs(grid, i + 1, j) # down
  dfs(grid, i - 1, j) # up
  dfs(grid, i, j + 1) # right
  dfs(grid, i, j - 1) # left
end
