module InCheck
  def check?
    in_check?('black') if @turn_counter.odd? && @turn_counter > 1
    in_check?('white') if @turn_counter.even? && @turn_counter > 1
  end

  def in_check?(color)
    king_location = locate_king(color)
    potential_moves = all_available_moves('white').flatten(1) if color == 'black'
    potential_moves = all_available_moves('black').flatten(1) if color == 'white'

    return false unless potential_moves.any?(king_location)

    puts 'White Player, your King is in check' if @turn_counter.even?
    puts 'Black Player, your King is in check' if @turn_counter.odd?
  end

  def locate_king(color)
    king = '♔' if color == 'black'
    king = '♚' if color == 'white'
    @board.each_with_index do |row, row_idx|
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
        available_moves.push(@pawn.moves)
      else
        piece_class = piece_to_class(piece, position)
        piece_moves = piece_class.moves
        available_moves.push(piece_moves)
      end
    end
    available_moves
  end

  def all_pieces_on_board(color)
    pos_array = []
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |square, square_idx|
        pos_array << [row_idx, square_idx] if @white_pieces.any?(square) && color == 'white'
        pos_array << [row_idx, square_idx] if @black_pieces.any?(square) && color == 'black'
      end
    end
    pos_array
  end
end
