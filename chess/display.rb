require "colorize"
require_relative "cursor"
require_relative "board"

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end
  
  def render
    @cursor.get_input
    
    @board.grid.each_with_index do |row, idx|
      row.each_index do |jdx|
        pos = [idx,jdx]
        if pos == @cursor.cursor_pos
          print "#{@board[pos].symbol}".colorize(:color =>:red, :background => :black)
          
        else
          print "#{@board[pos].symbol}".colorize(:color =>:yellow, :background => :black)
        end
      end
      print "\n"
    end
    
    @board
  end
end