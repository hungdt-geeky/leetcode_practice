# @param {Integer[][]} board
# @return {Integer}
def snakes_and_ladders(board)
  # 1. build number to board map
  n = board.length
  max_move = n * n
  num_board = Array.new(max_move + 1)
  num = 1
  row, col = [n - 1, -1]
  while row >= 0
    if col == n
      col -= 1
      while col >= 0
        num_board[num] = board[row][col]
        num += 1
        col -= 1
      end
    else
      col += 1
      while col < n
        num_board[num] = board[row][col]
        num += 1
        col += 1
      end
    end
    row -= 1
  end

  # 2. BFS
  visited = Array.new(max_move + 1, false)
  move = 0 # first_move -> 0
  first_move = 1
  visited[1] = true
  if num_board[1] != -1
    first_move = num_board[1]
    visited[first_move] = true
  end
  queue = [first_move]

  while queue.last
    size = queue.length
    (0...size).each do |_|
      current = queue.pop
      return move if current == max_move

      next_max = [current + 6, max_move].min
      ((current + 1)..next_max).each do |next_move|
        dest = num_board[next_move] != -1 ? num_board[next_move] : next_move
        unless visited[dest]
          queue.unshift(dest)
          visited[dest] = true
        end
      end
    end
    move += 1
  end

  -1
end