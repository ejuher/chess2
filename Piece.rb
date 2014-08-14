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

  def move_into_check?(new_pos)
    #duplicate the board and perform the move
    board_copy = board.dup
    # board_copy.rows[pos[0]][pos[1]] = nil
    # board_copy.rows[new_pos[0]][new_pos[1]] = self
    board_copy.force_move(pos, new_pos)
    board_copy.in_check?(color)
  end
  
  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def valid_moves
    moves
  end
  
  def to_s
    @color[0] + to_c
  end
end