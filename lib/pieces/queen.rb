class Queen
  attr_reader :moves

  def initialize
    @moves = [
      # up
      (1..7).map { |n| [-n, 0] },
      # down
      (1..7).map { |n| [n, 0] },
      # left
      (1..7).map { |n| [0, -n] },
      # right
      (1..7).map { |n| [0, n] },
      # Up Left Diagonally
      (1..7).map { |n| [-n, -n] },
      # Up Right Diagonally
      (1..7).map { |n| [-n, n] },
      # Down Left Diagonally
      (1..7).map { |n| [n, -n] },
      # Down Right Diagonally
      (1..7).map { |n| [n, n] }
    ]
  end
end