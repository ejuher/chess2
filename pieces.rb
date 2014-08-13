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
  
  def moves_in_bounds
    moves.select do |move|
      move[0].between?(0,7) && move[1].between?(0,7)
    end
  end
  
  def in_bounds?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def legal_moves
    moves_in_bounds
  end
  
  def to_s
    @color[0] + to_c
  end
end

# class SlidingPiece < Piece
#   def move_dirs
#     deltas.map do |delta|
#       (1..7).map do |slide|
#         next_mov = [pos[0] + delta[0] + slide, pos[1] + delta[1] * slide]
#
#       end
#     end
#   end
# end

class SlidingPiece < Piece
  def moves
    possible_moves = []
    deltas.each do |delta|
      slide = 1
      continue = true
      enemy_seen = false
      
      until slide > 7 || !continue || enemy_seen 
        next_move = [pos[0] + delta[0] * slide, pos[1] + delta[1] * slide]
        next_square = board.rows[next_move[0]][next_move[1]]
        
        #check is occupied by friendly piece or is out of bounds
        if (!next_square.nil? && next_square.color == color) || 
          !in_bounds?(next_move)
          
          continue = false
        else
          if !next_square.nil? && next_square.color == flip_color(color)
            enemy_seen = true
          end
          
          possible_moves << next_move 
          slide += 1
        end
      end
    end
    possible_moves
  end
end


class SteppingPiece < Piece
  def moves
    possible_moves = deltas.map do |delta| 
      [delta[0] + pos[0], delta[1] + pos[1]]
    end
    #select moves to squares which are not occupied by piece of same color
    possible_moves.reject do |pos_move| 
      (!board.rows[pos_move[0]][pos_move[1]].nil? && 
      board.rows[pos_move[0]][pos_move[1]].color == color) || 
      !in_bounds?(pos_move)
    end 
  end
end

class Bishop < SlidingPiece
  def deltas
    [-1, 1].product([-1, 1])
  end
  
  def to_c
    "b"
  end
end

class Rook < SlidingPiece
  def deltas
    deltas = [[0,1], [0, -1]]
    deltas + deltas.map { |delta| delta.reverse }
  end
  
  def to_c
    "r"
  end
end

class Queen < SlidingPiece
  def deltas
    deltas = [[0,1], [0, -1]]
    deltas += deltas.map { |delta| delta.reverse }
    deltas += [-1, 1].product([-1, 1])
  end
  
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
  #add starting_position variable to initialization
  #if current_position == starting_position then it can move forward two spaces
  def to_c
    "p"
  end
end