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
        if [idx,jdx] == @cursor.cursor_pos
          print "Y"
        else
          print "X"
        end
      end
      print "\n"
    end
  end
end