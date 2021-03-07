class Bishop
  attr_reader :moves

  def initialize
    @moves = [
      # Up Left Diagonally
      (1..7).map { |n| [-n, -n] }.freeze,
      # Up Right Diagonally
      (1..7).map { |n| [-n, n] }.freeze,
      # Down Left Diagonally
      (1..7).map { |n| [n, -n] }.freeze,
      # Down Right Diagonally
      (1..7).map { |n| [n, n] }.freeze
    ].flatten(1)
  end
end