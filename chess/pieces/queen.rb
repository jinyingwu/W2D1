require_relative "piece"
require_relative "modules"

class Queen < Piece
  include SlidingPiece
  
  def initialize(pos, board, color)
    super
    @symbol = :queen
  end
  
  def move_dirs
    diagonal_dir + horizontal_dir
  end  
  
end