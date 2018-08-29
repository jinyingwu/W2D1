require "colorize"
require_relative "cursor"
require_relative "board"
require "byebug"

class Display
  
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
  end
  
  def render
    @cursor.get_input
    
    # print ""
    @board.grid.each_with_index do |row, idx|
      row.each_index do |jdx|
        pos = [idx,jdx]
        
        # debugger
        if pos == @cursor.cursor_pos
          print "#{@board[pos].to_s}".colorize(:color =>:red, :background => :black)
        else
          print "#{@board[pos].to_s}".colorize(:color =>:yellow, :background => :black)
        end
      end
      print "\n"
      
    end
    
    @board
  end
end

if __FILE__ == $PROGRAM_NAME
  d = Display.new(Board.new)
  d.render
end