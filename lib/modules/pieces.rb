# technically the colour of the unicode characters is the other way around
# but terminal shows black as opaque white, and white as transparent
# which just makes it confusing as most terminals are black or purple, it make sense to be rotated.
# could cause issues with terminals with white backgrounds. Needs to be tested.
module Pieces
  BLACK_KING = "\u2654".freeze
  BLACK_QUEEN = "\u2655".freeze
  BLACK_ROOK = "\u2656".freeze
  BLACK_BISHOP = "\u2657".freeze
  BLACK_KNIGHT = "\u2658".freeze
  BLACK_PAWN = "\u2659".freeze
  WHITE_KING = "\u265A".freeze
  WHITE_QUEEN = "\u265B".freeze
  WHITE_ROOK = "\u265C".freeze
  WHITE_BISHOP = "\u265D".freeze
  WHITE_KNIGHT = "\u265E".freeze
  WHITE_PAWN = "\u265F".freeze
end
