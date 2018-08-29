require_relative "piece"
require_relative "modules"

class Pawn < Piece
  
  def initialize(pos, board, color)
    super
    @symbol = :pawn
  end
  
  def moves
    result = []
    diffs = @color == :black ? BLACK_DIFFS : WHITE_DIFFS
    
    new_pos = [@pos[0] + diffs[0][0],@pos[1] + diffs[0][1]]
    result << new_pos if move_into_check?(new_pos) && @board[new_pos].class == NullPiece
    
    new_pos = [@pos[0] + diffs[1][0],@pos[1] + diffs[1][1]]
    result << new_pos if first_move? && @board[new_pos].class == NullPiece
    
    diffs[2..-1].each do |diff|
      new_pos = [@pos[0] + diff[0],@pos[1] + diff[1]]
      if move_into_check?(new_pos) && @board[new_pos].class != NullPiece && @board[new_pos].color != @color
        result << new_pos 
      end
    end
    
    result
  end 
  
  def first_move?
    if @color == :black
      @pos[0] == 1 ? true : false
    else
      @pos[0] == 6 ? true : false
    end
  end
  
  # def base_move
  #   new_pos = [@pos[0] + diffs[0][0],@pos[1] + diffs[0][1]]
  #   result << new_pos if move_into_check?(new_pos) && @board[new_pos].class == NullPiece
  # end
  
  private 
  BLACK_DIFFS = [[1, 0], [2, 0], [1, -1], [1, 1]]
  WHITE_DIFFS = [[-1,0], [-2,0], [-1,-1], [-1,1]]
end