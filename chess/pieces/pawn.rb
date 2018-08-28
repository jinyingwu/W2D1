require_relative "piece"
require_relative "modules"

class Pawn < Piece
  
  def initialize(pos, board, color)
    super
    @symbol = :Pawn
    @first_move = true
  end
  
  def moves
    result = []
    diffs = @color == :black ? BLACK_DIFFS : WHITE_DIFFS
    
    new_pos = [@pos[0] + diffs[0][0],@pos[1] + diffs[0][1]]
    result << new_pos if move_into_check?(new_pos) && @board[new_pos].class == NullPiece
    
    new_pos = [@pos[0] + diffs[1][0],@pos[1] + diffs[1][1]]
    if @first_move && @board[new_pos].class == NullPiece
      result << new_pos 
      @first_move = false
    end
    
    diffs[2..-1].each do |diff|
      new_pos = [@pos[0] + diff[0],@pos[1] + diff[1]]
      if move_into_check?(new_pos) && @board[new_pos].class != NullPiece && @board[new_pos].color != @color
        result << new_pos 
      end
    end
    
    result
  end 
  
  private 
  BLACK_DIFFS = [[1, 0], [2, 0], [1, -1], [1, 1]]
  WHITE_DIFFS = [[-1,0], [-2,0], [-1,-1], [-1,1]]
end