require_relative "piece"
require_relative "modules"

class King < Piece
  include SteppingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :king
  end
  
end