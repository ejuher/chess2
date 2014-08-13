class Board 
  def initialize
    setup_board
  end
  
  def setup_board
    
  end
  
  def in_check?(color)
  end
  
  def move(start, end_pos)
  end
end

class Piece
  def initialize(board, position, color)
  end
  
  def moves
  end
end

class SlidingPiece < Piece
  def move_dirs
  end
end

class SteppingPiece < Piece
  def move_dirs
  end
end

class Bishop < SlidingPiece
end

class Rook < SlidingPiece
end

class Queen < SlidingPiece
end

class Knight < SteppingPiece
end

class King < SteppingPiece
end

class Pawn < Piece
end
