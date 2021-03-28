module PathCreator
  def path_creator(current_position, moves)
    all_paths_array = []
    direction_array = []
    cur_x = current_position[0]
    cur_y = current_position[1]
    moves.each do |direction| # each nested array of all moves for piece split by direction
      direction.each do |x, y| # each move in the nested arrays
        direction_array << [cur_x + x, cur_y + y] if (cur_x + x).between?(0, 7) && (cur_y + y).between?(0, 7)
      end
      all_paths_array.push(direction_array) # pushes the array of legal moves into one array
      direction_array = []
    end
    all_paths_array # returns the array of legal move arrays
  end

  def path_checker(all_paths, board, colour)
    real_path = []
    all_paths.each do |direction|
      direction.each do |coords| # goes through path
        square = board[coords[0]][coords[1]] # square becomes what ever is in that position on the board
        break if colour == 'white' && @white_pieces.any?(square) # if it reaches one of the players own pieces, break
        break if colour == 'black' && @black_pieces.any?(square)

        real_path << coords
        # if it reaches one of the opposition pieces, break after adding the position to the path
        # this then allows you to take the piece, but not go any further
        break if colour == 'black' && @white_pieces.any?(square)
        break if colour == 'white' && @black_pieces.any?(square)
      end
    end
    real_path
  end
end
