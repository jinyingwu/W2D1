require_relative "piece"
require_relative "modules"

class Bishop < Piece
  include SlidingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :Bishop
  end
  
end