require_relative '../modules/path_creator'

class King
  attr_reader :moves

  include PathCreator

  def initialize(current_position, board)
    @black_pieces = %w[♔ ♕ ♗ ♖ ♘ ♙]
    @white_pieces = %w[♚ ♛ ♝ ♜ ♞ ♟]
    all_moves = [[[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]]
    all_paths = path_creator(current_position, all_moves).flatten(1)
    colour = colour(current_position, board)
    @moves = king_and_knight_path(all_paths, board, colour)
  end

  def colour(current_position, board)
    piece = board[current_position[0]][current_position[1]]

    return 'white' if @white_pieces.any?(piece)
    return 'black' if @black_pieces.any?(piece)
  end
end
