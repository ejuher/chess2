class Board
  attr_reader :rows

  def initialize
    setup_board
  end

  def setup_board
    @rows = Array.new(8) { Array.new(8) }

    [:white, :black].each do |color|
      place_pawns(color)
      place_royalty(color)
    end
  end
  
  # def to_s
  #   @rows.each do |row|
  #     row.join(' ')
  #   end
  # end

  def place_pawns(color)
    color == :white ? row = 1 : row = 6
    (0..7).each do |col|
      @rows[row][col] = Pawn.new(@rows, [row, col], color)
    end
  end

  def place_royalty(color)
    color == :white ? row = 0 : row = 7
      @rows[row][0] = Rook.new(@rows, [row, 0], color) 
      @rows[row][1] = Knight.new(@rows, [row, 1], color) 
      @rows[row][2] = Bishop.new(@rows, [row, 2], color) 
      @rows[row][3] = Queen.new(@rows, [row, 3], color)
      @rows[row][4] = King.new(@rows, [row, 4], color)
      @rows[row][5] = Bishop.new(@rows, [row, 5], color)
      @rows[row][6] = Knight.new(@rows, [row, 6], color)
      @rows[row][7] = Rook.new(@rows, [row, 7], color)
  end

  # def [](pos)
  #   row, col = pos
  #   @rows[row][col]
  # end
  #
  # def []=(pos, value)
  #   row, col = pos
  #   @rows[row][col] = value
  # end

  def in_check?(color)
  end

  def move(start, end_pos)
  end
end

class Piece
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
