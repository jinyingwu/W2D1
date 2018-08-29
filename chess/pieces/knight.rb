require_relative "piece"
require_relative "modules"

class Knight < Piece
  include SteppingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :knight
  end
  
end