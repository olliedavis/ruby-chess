class King
  attr_reader :moves
  
  def initialize
    @moves = [[-1, -1], [-1, 0], [-1, 1],[0, -1],[0, 1], [1, -1], [1, 0], [1, 1]].freeze
  end
end
