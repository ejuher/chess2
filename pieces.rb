class Piece
  attr_accessor :position, :row
  attr_reader :color
  
  def initialize(row, position, color)
    @row = row
    @position = position
    @color = color
  end
  
  def flip_color(color)
    color == :white ? :black : :white
  end

  def move_into_check?
  end
  
  def moves_in_bounds
    move_dirs.select do |move|
      move[0].between?(0,7) && move[1].between?(0,7)
    end
  end

  def moves
    moves_in_bounds
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
    possible_moves = deltas.map do |delta| 
      [delta[0] + position[0], delta[1] + position[1]]
    end
    #select moves to squares which are not occupied by piece of same color
    possible_moves.reject do |pos| 
      !row[pos[0]][pos[1]].nil? && row[pos[0]][pos[1]].color == color
    end 
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
  def deltas
    [1,-1].product([2,-2]) + [2,-2].product([1,-1])
  end
  
  def to_c
    "k"
  end
end

class King < SteppingPiece
  def deltas
    [0,1,-1].product([0,1,-1]).drop(1)
  end
  
  def to_c
    "K"
  end
end

class Pawn < Piece
  def to_c
    "p"
  end
end