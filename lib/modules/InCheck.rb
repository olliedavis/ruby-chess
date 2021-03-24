module InCheck
  def in_check?(color)
    king_location = locate_king(color)
    potential_moves = all_available_moves(color)
    puts "true" if potential_moves.any?(king_location)

    false
  end

  def locate_king(color)
    king = '♔' if color == 'black'
    king = '♚' if color == 'white'
    @chessboard.board.each_with_index do |row, row_idx|
      row.each_with_index do |square, square_idx|
        return [row_idx, square_idx] if square == king
      end
    end
  end

  def all_available_moves(color)
    pos_array = all_pieces_on_board(color)
    available_moves = []
    pos_array.each do |position|
      piece = index_to_piece(position)
      if @pawns.any?(piece)
        available_moves.push(@pawn.possible_moves(piece, position, @chessboard.board))
      else
        piece_class = piece_to_class(piece)
        piece_class.moves.each { |x, y| available_moves.push([(position[0] + x), (position[1] + y)]) }
      end
    end
    available_moves
  end

  def all_pieces_on_board(color)
    pos_array = []
    @chessboard.board.each_with_index do |row, row_idx|
      row.each_with_index do |square, square_idx|
        if @white_pieces.any?(square) && color == 'white'
          pos_array << [row_idx, square_idx]
        elsif @black_pieces.any?(square) && color == 'black'
          pos_array << [row_idx, square_idx]
        end
      end
    end
    pos_array
  end
end