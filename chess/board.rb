require_relative "piece"
require_relative "bishop"
require_relative "king"
require_relative "queen"
require_relative "rook"
require_relative "pawn"
require_relative "knight"

class Board
  attr_accessor :grid
  
  BACKLINE = [:rook, :knight, :bishop, :queen, :king, :bishop, :knight, :rook]
  CLASSMAP = {rook:Rook, knight:Knight, bishop:Bishop, queen:Queen, king:King}
  
  def initialize(size = 8)
    null_piece = NullPiece.instance
    @grid = Array.new(size) { Array.new(size){null_piece}}
    fill_grid
  end
  
  def [](pos)
    x,y = pos
    @grid[x][y] 
  end
   
  def []=(pos, value)
    x,y = pos
    @grid[x][y] = value
  end 
  
  def fill_grid
    @grid.each_with_index do |row, idx|
      case idx 
      when 0
        row = fill_back_line(:black, idx)
      when 1
        row = (0..7).reduce([]) {|acc, jdx| acc << Pawn.new([idx, jdx], self, :black)}
      when 6
        row = (0..7).reduce([]) {|acc, jdx| acc << Pawn.new([idx, jdx], self, :white)}
      when 7
        row = fill_back_line(:white, idx)
      end 
    end 
  end

  
  def fill_back_line(color, row_index)
    BACKLINE.each_with_index.reduce([]) do |back, (el, idx)|
      back << CLASSMAP[el].new([row_index, idx], self, color)
    end 
  end 
  
  def move_piece(start_pos, end_pos)
    x,y = start_pos
    end_x, end_y = end_pos
    
    raise "No piece at position #{x},#{y}" if @grid[x][y].class == NullPiece
    raise "Out of bounds" if valid_pos?(end_pos) || valid_pos?(start_pos)
    
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end
  
  def display
    puts @grid
  end
  
  def inspect
    "Board exists"
  end
  
  def valid_pos?(pos)
    pos.each do |el|
      return false unless (0..7).include?(el)
    end 
    
    true
  end 
  
end 

# b = Board.new
# b.move_piece([0,0], [3,0])
# b.display
