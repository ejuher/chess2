require "./Piece"


class SlidingPiece < Piece
  def moves
    possible_moves = []
    deltas.each do |delta|
      slide = 1
      continue = true
      enemy_seen = false
      
      until slide > 7 || !continue || enemy_seen 
        
        next_move = [pos[0] + delta[0] * slide, pos[1] + delta[1] * slide]
        if in_bounds?(next_move)
          next_square = board.rows[next_move[0]][next_move[1]]
          #check is occupied by friendly piece 
          if (!next_square.nil? && next_square.color == color) 
            continue = false
          else
            if !next_square.nil? && next_square.color == flip_color(color)
              enemy_seen = true
            end
            
            possible_moves << next_move 
            slide += 1
          end
        else
          continue = false
        end
      end
    end
    possible_moves
  end
end