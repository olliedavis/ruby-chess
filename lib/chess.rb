require_relative 'board'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }
class Chess
  def initialize
    @chessboard = Chessboard.new.board
    @pieces = %w[king queen rook bishop knight pawn]
    @king = King.new
    @queen = Queen.new
    @bishop = Bishop.new
    @rook = Rook.new
    @knight = Knight.new
    @pawn = Pawn.new
    @turn_counter = 0
  end

  def player_input
    if @turn_counter.zero?
      puts "White's turn! Please enter the position of the piece you want to move"
    else
      puts "Black's turn! Please enter the position of the piece you want to move"
    end

    piece = gets.chomp
    until valid_piece?(piece)
      puts 'Are you sure that position contains one of your pieces? Please try again.'
      piece = gets.chomp
    end
  end

  def move_validator(piece, input, current_position_index, new_position_index)
    valid_position?(input)
    legal_move?(piece, current_position_index, new_position_index)
  end

  def valid_position?(input)
    if input.length == 2
      y_axis = input[0].to_i
      x_axis = input[1]
      return true if y_axis.between?(1, 8) && x_axis.downcase.between?('a', 'h')
    end
    false
  end

  def valid_piece?(input)
    return true if input.include?(input.downcase)

    false
  end

  def legal_move?(piece, current_position_index, new_position_index)
    current_piece = piece_to_class(piece)
    current_piece.moves.each do |x, y|
      return true if new_position_index == [(current_position_index[0] + x), (current_position_index[1] + y)]
    end
  end

  def piece_to_class(piece)
    case piece
    when 'king'
      @king
    when 'queen'
      @queen
    when 'bishop'
      @bishop
    when 'rook'
      @rook
    when 'knight'
      @knight
    when 'pawn'
      @pawn
    end
  end

end
