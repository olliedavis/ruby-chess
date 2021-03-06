class Queen
  attr_reader :moves

  def initialize
    @moves = [
      # up
      (1..7).map { |n| [-n, 0] }.freeze,
      # down
      (1..7).map { |n| [n, 0] }.freeze,
      # left
      (1..7).map { |n| [0, -n] }.freeze,
      # right
      (1..7).map { |n| [0, n] }.freeze,
      # Up Left Diagonally
      (1..7).map { |n| [-n, -n] }.freeze,
      # Up Right Diagonally
      (1..7).map { |n| [-n, n] }.freeze,
      # Down Left Diagonally
      (1..7).map { |n| [n, -n] }.freeze,
      # Down Right Diagonally
      (1..7).map { |n| [n, n] }.freeze
    ]
  end
end