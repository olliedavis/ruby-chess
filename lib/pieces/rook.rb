class Rook
  attr_reader :moves

  def initialize
    @moves =[
      # up
      (1..7).map { |n| [-n, 0] }.freeze,
      # down
      (1..7).map { |n| [n, 0] }.freeze,
      # left
      (1..7).map { |n| [0, -n] }.freeze,
      # right
      (1..7).map { |n| [0, n] }.freeze
    ].flatten(1)
  end
end
