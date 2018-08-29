require_relative "piece"
require_relative "modules"

class King < Piece
  include SteppingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :king
  end
  
  def move_diffs
    [[1, 0], [-1, 0], [0, 1], [0, -1],[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end
end