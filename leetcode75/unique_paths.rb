# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  # Initialize an m x n grid with all values set to 0
  grid = Array.new(m) { Array.new(n, 0) }

  # Set the value at the first cell to 1, because there is only 1 way to reach it (i.e., from the start)
  grid[0][0] = 1

  # Iterate through each cell in the grid
  (0...m).each do |i|
    (0...n).each do |j|
      # If we are not at the first cell, then the number of ways to reach the current cell is equal to
      # the sum of the number of ways to reach the cell above it and the number of ways to reach the cell to the left of it
      if i > 0 && j > 0
        grid[i][j] = grid[i - 1][j] + grid[i][j - 1]
      # If we are at the first row, then the number of ways to reach the current cell is equal to the number of ways to reach the cell to the left of it
      elsif i == 0 && j > 0
        grid[i][j] = grid[i][j - 1]
      # If we are at the first column, then the number of ways to reach the current cell is equal to the number of ways to reach the cell above it
      elsif i > 0 && j == 0
        grid[i][j] = grid[i - 1][j]
      end
    end
  end

  # Return the number of ways to reach the bottom-right corner (i.e., the value at the last cell in the grid)
  grid[m - 1][n - 1]
end