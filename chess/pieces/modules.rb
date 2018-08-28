module SlidingPiece
  
  def moves
    move_dirs.reduce([]) do |acc, dir|
      new_pos = [@pos.first + dir.first, @pos.last + dir.last]
      
      while move_into_check?(new_pos) && @board[new_pos].class == NullPiece
        acc << new_pos
        new_pos = [new_pos.first + dir.first, new_pos.last + dir.last]
      end
      
      if @board[new_pos].color != @color && move_into_check?(new_pos) 
        acc << new_pos
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
  def moves
    move_diffs.reduce([]) do |acc, dir|
      new_pos = [@pos.first + dir.first, @pos.last + dir.last]
      acc << new_pos if move_into_check?(new_pos) && @board[new_pos].color != @color
      acc
    end 
  end
end