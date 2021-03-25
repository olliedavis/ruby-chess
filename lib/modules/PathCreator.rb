module PathCreator

  def path_creator(current_position, moves)
    all_paths_array = []
    direction_array = []
    cur_x = current_position[0]
    cur_y = current_position[1]
    moves.each do |direction| # each nested array of moves
      direction.each do |x, y| # each move in the nested arrays
        direction_array.push([(cur_x + x), (cur_y + y)]) if (cur_x + x).between?(0, 7) && (cur_y + y).between?(0, 7)
      end
      all_paths_array.push(direction_array) # pushes the array of legal moves into one array
      direction_array = []
    end
    all_paths_array # returns the array of legal move arrays
  end

  def path_checker(all_paths, board)
    real_path = []
    all_paths.each do |direction|
      direction.each do |coords|
        break if board[coords[0]][coords[1]] != ' '

        real_path << coords
      end
    end
    real_path
  end
end