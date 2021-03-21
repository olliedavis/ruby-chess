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
    # converts input to equivalent index and checks if that index matches a piece of their color
    index = input_to_index(input)
    if @turn_counter.even? && @white_pieces.any? { |piece| @chessboard.board[index[0]][index[1]] == piece }
      true
    elsif @turn_counter.odd? && @black_pieces.any? { |piece| @chessboard.board[index[0]][index[1]] == piece }
      true
    else
      puts 'Unrecognised Piece - Please try again'
      false
    end
  end

  def legal_move?(first_input, second_input)
    piece = input_to_piece(first_input)
    piece_class = input_to_class(first_input, second_input) # converts the first input to a class
    original_position = input_to_index(first_input) # converts the first input to index
    new_position = input_to_index(second_input) # converts the second input to index

    return false if new_space_free?(second_input) == false
    return false if @pawns.any?(piece) && pawn_free_path?(new_position) == false

    piece_class.moves.each do |x, y| # returns true if new position matches any of the piece's move set
      return true if new_position == [(original_position[0] + x), (original_position[1] + y)]
    end
    false
  end

  def new_space_free?(second_input)
    new_position = input_to_piece(second_input)
    # new position doesn't contain own piece then it's free to move to
    if @turn_counter.even? && @white_pieces.include?(new_position) == false
      true
    elsif @turn_counter.odd? && @black_pieces.include?(new_position) == false
      true
    else
      false
    end
  end

  def pawn_free_path?(second_index)
    return true if @chessboard.board[second_index[0]][second_index[1]] == ' '

    puts 'The pawn is blocked'
    false
  end
end
