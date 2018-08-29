require_relative "piece"
require_relative "modules"

class Queen < Piece
  include SlidingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :queen
  end
  
end