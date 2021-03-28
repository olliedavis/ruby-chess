require_relative '../modules/path_creator'

class Queen
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
    straight + diagonal
  end

  def straight
    [(1..7).map { |n| [-n, 0] }.freeze,  # up
     (1..7).map { |n| [n, 0] }.freeze,   # down
     (1..7).map { |n| [0, -n] }.freeze,  # left
     (1..7).map { |n| [0, n] }.freeze]   # right
  end

  def diagonal
    [(1..7).map { |n| [-n, -n] }.freeze, # up left
     (1..7).map { |n| [-n, n] }.freeze,  # up right
     (1..7).map { |n| [n, -n] }.freeze,  # down left
     (1..7).map { |n| [n, n] }.freeze]   # down right
  end

  def colour(current_position, board)
    piece = board[current_position[0]][current_position[1]]
    return 'white' if @white_pieces.any?(piece)
    return 'black' if @black_pieces.any?(piece)
  end
end
