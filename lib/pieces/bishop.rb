require_relative '../modules/PathCreator'

class Bishop
  attr_reader :moves

  include PathCreator

  def initialize(current_position, board)
    @black_pieces = ['♔', '♕', '♗', '♖', '♘', '♙']
    @white_pieces = ['♚', '♛', '♝', '♜', '♞', '♟']
    all_paths = path_creator(current_position, all_moves)
    colour = colour(current_position, board)
    @moves = path_checker(all_paths, board, colour)
  end

  def all_moves
    [(1..7).map { |n| [-n, -n] }.freeze, # Up Left
     (1..7).map { |n| [-n, n] }.freeze,  # Up Right
     (1..7).map { |n| [n, -n] }.freeze,  # Down Left
     (1..7).map { |n| [n, n] }.freeze]   # Down Right
  end

  def colour(current_position, board)
    piece = board[current_position[0]][current_position[1]]

    return 'white' if @white_pieces.any?(piece)
    return 'black' if @black_pieces.any?(piece)
  end
end
