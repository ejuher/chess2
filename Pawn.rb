require "./Piece"

class Pawn < Piece
  def initialize(board, pos, color)
    super(board, pos, color)
    @start_pos = pos
  end

  def moves
    dr = @color == :white ? 1 : -1
    
    moves = []
    
    if in_bounds?([pos[0] + dr, pos[1]]) && board.rows[pos[0] + dr][pos[1]].nil?
      moves << [pos[0] + dr, pos[1]]   
      if @start_pos == pos && board.rows[pos[0] + dr * 2][pos[1]].nil?
        moves << [pos[0] + dr * 2, pos[1]]
      end
    end
    
    [1, -1].each do |lateral|
      atk_move = [pos[0] + dr, pos[1] + lateral]
      if in_bounds?(atk_move) && !board.rows[atk_move[0]][atk_move[1]].nil? && 
        board.rows[atk_move[0]][atk_move[1]].color != color
         
        moves << atk_move
      end
    end
    
    moves
  end
  
  def to_c
    "p"
  end
end