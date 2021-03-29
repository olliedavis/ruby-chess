module Checkmate
  def checkmate?(colour)
    king_location = locate_king(colour)
    king = '♔' if colour == 'black'
    king = '♚' if colour == 'white'
    king_class = piece_to_class(king, king_location)
    king_moves = king_class.moves
    opp_moves = opposition_moves(colour)
    # true if all of the kings moves are included in the oppositions move set
    # empty? has been added as technically the king has no moves at the start of the game
    return true if king_moves.all? { |move| opp_moves.any?(move) } && king_moves.flatten.empty? == false
  end

  def opposition_moves(colour)
    return all_available_moves('white').flatten(1) if colour == 'black'
    return all_available_moves('black').flatten(1) if colour == 'white'
  end
end
