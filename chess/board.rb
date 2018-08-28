require_relative "piece"

class Board
  attr_accessor :grid
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
      if idx == 0 || idx == 1
        row.each_index {|jdx| row[jdx] = Piece.new([idx, jdx], self, :black)}
      elsif idx == 6 || idx == 7
        row.each_index {|jdx| row[jdx] = Piece.new([idx, jdx], self, :white)}
      end
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
