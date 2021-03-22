module InCheck
  def all_pieces_on_board(color)
    pos_array = []
    @chessboard.board.each_with_index do |row, row_idx|
      row.each_with_index do |square, square_idx|
        if @white_pieces.any?(square) && color == 'white'
          pos_array << [row_idx, square_idx]
        elsif @black_pieces.any?(square) && color == 'black'
          pos_array << [row_idx, square_idx]
        else
          next
        end
      end
    end
    pos_array
  end

  def all_available_moves(pos_array)
    available_moves = []
    pos_array.each do |position|
      piece = index_to_piece(position)
      return available_moves.push(@pawn.possible_moves(position, @chessboard.board)) if @pawns.any?(piece)

      piece_class = piece_to_class(piece)
      piece_class.moves.each { |x, y| available_moves.push([(position[0] + x), (position[1] + y)]) }
    end
    available_moves
  end
end
