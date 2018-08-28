require 'singleton'

module SlidingPiece
  
  def moves(directions)
    directions.reduce([]) do |acc, dir|
      new_pos = [@pos.first + dir.first, @pos.last + dir.last]
      while new_pos.all? { |el| (0..7).include?(el)}
        acc << new_pos
        new_pos = [new_pos.first + dir.first, new_pos.last + dir.last]
      end 
      acc
    end 
  end
  
  def horizontal_dir 
    HORIZONTAL_DIRS
  end 
  
  def diagonal_dir 
    DIAGONAL_DIR
  end 
  
  private
  HORIZONTAL_DIRS =[[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIR = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  
end

module SteppingPiece
  def moves(directions)
    directions.reduce([]) do |acc, dir|
      new_pos = [@pos.first + dir.first, @pos.last + dir.last]
      acc << new_pos if new_pos.all? { |el| (0..7).include?(el)}
      acc
    end 
  end
end

class Piece
  attr_accessor :value, :pos, :color
  
  def initialize(pos, board, color)
    @value = "X"
    @pos = pos
    @board = board
    @color = color
  end
  
  def to_s(symbol)
    "Piece: #{symbol}, Pos: #{@pos}, Color: #{@color}"
  end
  
  def empty?
    
  end
  
  def valid_move(pos)
    pos.all? { |el| (0..7).include?(el)}
  end
  
  def inspect
  end
end 

class NullPiece < Piece
  
  include Singleton
  
  def initialize
    @value = "O"
  end
  
  def inspect
  end
    
end 