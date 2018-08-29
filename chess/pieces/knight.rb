require_relative "piece"
require_relative "modules"

class Knight < Piece
  include SteppingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :knight
  end
  
  def move_diffs
    [[2,1],[-2,1],[2,-1],[-2,-1],[1,-2],[1,2],[-1,-2],[-1,2]]
  end
  
end