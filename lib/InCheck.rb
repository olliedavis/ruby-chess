module InCheck
  def all_pieces_on_board
    white_pieces_pos_array = []
    black_pieces_pos_array = []
    @chessboard.board.each_with_index do |row, row_idx|
      row.each_with_index do |square, square_idx|
        if @white_pieces.any?(square)
          white_pieces_pos_array << [row_idx, square_idx]
        elsif @black_pieces.any?(square)
          black_pieces_pos_array << [row_idx, square_idx]
        else
          next
        end
      end
    end
    all_available_moves(white_pieces_pos_array, black_pieces_pos_array)
  end

  def all_available_moves(white_array, black_array)
    white_array.each do |position|
      piece = index_to_piece(position)
      if @pawn.any?(piece)
        piece_class = piece_to_class(piece, position)
      end
    end
  end
end