class Piece
  attr_accessor :pos, :board
  attr_reader :color
  
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end
  
  def flip_color(color)
    color == :white ? :black : :white
  end

  def move_into_check?
  end
  
  # def moves_in_bounds
  #   moves.select do |move|
  #     move[0].between?(0,7) && move[1].between?(0,7)
  #   end
  # end
  
  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def legal_moves
    moves
  end
  
  def to_s
    @color[0] + to_c
  end
end