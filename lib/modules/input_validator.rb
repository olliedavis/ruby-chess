module InputValidator
  def first_choice_validator(input)
    # returns to start if input is not valid
    return false if valid_input?(input) == false || valid_piece?(input) == false
  end

  def second_choice_validator(first_input, second_input)
    # returns to 2nd choice input if input is not valid
    return false if valid_input?(second_input) == false || legal_move?(first_input, second_input) == false

    true
  end

  def valid_input?(input)
    return true if input.length == 2 && input[0].between?('A', 'H') && input[1].between?('1', '8')

    puts 'Unrecognised input - Please try again like this: B2'
    false
  end

  def valid_piece?(input)
    # converts input to equivalent index and checks if that index matches a piece of their colour
    index = input_to_index(input)
    square = @chessboard.board[index[0]][index[1]]

    if @turn_counter.even? && @white_pieces.any? { |piece| square == piece }
      true
    elsif @turn_counter.odd? && @black_pieces.any? { |piece| square == piece }
      true
    else
      puts 'Unrecognised Piece - Please try again'
      false
    end
  end

  def legal_move?(first_input, second_input)
    piece = input_to_piece(first_input)
    piece_class = input_to_class(first_input, second_input) # converts the first input to a class
    curr_position = input_to_index(first_input)
    new_position = input_to_index(second_input) # converts the second input to index
    return false if @pawns.any?(piece) && pawn_free_path?(curr_position, new_position) == false

    # returns true if new position matches any of the piece's move set
    piece_class.moves.each { |x, y| return true if new_position == [x, y] }
    false
  end

  def pawn_free_path?(first_index, second_index)
    y_diff = first_index[1] - second_index[1]
    # if y_diff != 0, then it must be going diagonal
    # if it's going diagonal, then the new position will be occupied by the position
    return true if @chessboard.board[second_index[0]][second_index[1]] == ' ' || y_diff.zero? == false

    puts 'The pawn is blocked'
    false
  end
end
