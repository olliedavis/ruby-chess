class Bishop
  attr_reader :moves
  def initialize
    up_left_diag = (1..8).map { |n| [-n, -n] }
    up_right_diag = (1..8).map { |n| [-n, n] }
    down_left_diag = (1..8).map { |n| [n, -n] }
    down_right_diag = (1..8).map { |n| [n, n] }
    @moves = [up_left_diag, up_right_diag, down_left_diag, down_right_diag]
  end
end

Bishop.new
