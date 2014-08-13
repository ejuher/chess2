class Piece
  attr_accessor :position, :board
  
  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def moves
  end
  
  def to_s
    @color[0] + to_c
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
  def to_c
    "b"
  end
end

class Rook < SlidingPiece
  def to_c
    "r"
  end
end

class Queen < SlidingPiece
  def to_c
    "q"
  end
end

class Knight < SteppingPiece
  def to_c
    "k"
  end
end

class King < SteppingPiece
  def to_c
    "K"
  end
end

class Pawn < Piece
  def to_c
    "p"
  end
end