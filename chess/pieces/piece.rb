require 'singleton'
require_relative "board"

class Piece
  attr_accessor :pos, :color
  
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end
  
  def to_s
    "Piece: #{symbol}, Pos: #{@pos}, Color: #{@color}"
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
  
  def inspect
  end
    
end 