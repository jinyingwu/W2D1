require_relative "pieces/piece"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/pawn"
require_relative "pieces/knight"

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
        @grid[idx] = fill_back_line(:black, idx)
      when 1
        @grid[idx] = (0..7).reduce([]) {|acc, jdx| acc << Pawn.new([idx, jdx], self, :black)}
      when 6
        @grid[idx] = (0..7).reduce([]) {|acc, jdx| acc << Pawn.new([idx, jdx], self, :white)}
      when 7
        @grid[idx] = fill_back_line(:white, idx)
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
  
  def check_mate?(color)
    king = @grid.select { |el| el.color != color && el.symbol == :king}
    
    if in_check?
      true if king.valid_moves.empty?
    else 
      false
    end  
  end 
  
  def in_check?(color)
    king_pos = @grid.select { |el| el.color != color && el.symbol == :king}.pos
    
    check = false
    @grid.each do |el| 
      el.each do |el2| 
        check = true if el2.color == color && el2.valid_moves.include?(king_pos)
      end 
    end 
    
    check
  end
end 

# b = Board.new
# b.move_piece([0,0], [3,0])
# b.display
