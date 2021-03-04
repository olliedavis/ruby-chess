class Bishop
  attr_reader :moves
  def initialize
    @moves = [
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

Bishop.new
