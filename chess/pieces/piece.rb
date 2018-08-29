require 'singleton'
# require_relative "board"

class Piece
  attr_accessor :pos, :color
  
  WHITE_PIECEMAP = {rook:"♖", knight:"♘", bishop:"♗", queen:"♕", king:"♔", pawn:'♙'}
  BLACK_PIECEMAP = {rook:"♜", knight:"♞", bishop:"♝", queen:'♛', king:'♚', pawn:"♟"}
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end
  
  def to_s
     @color == :white ? WHITE_PIECEMAP[@symbol] : BLACK_PIECEMAP[@symbol]
  end
  
  def empty?
    
  end
  
  def valid_moves
    moves
  end
  
  def symbol
    @symbol
  end
  
  def pos=(val)
    @pos = val
  end
  
  def inspect
  end
  
  private
  def move_into_check?(end_pos)
    end_pos.all? { |el| (0..7).include?(el)}
  end
end 

class NullPiece < Piece
  
  include Singleton
  
  def initialize
    @color = :gray
    @symbol = :null
  end
  
  def to_s
    "X"
  end 
  
  def inspect
  end
    
end 