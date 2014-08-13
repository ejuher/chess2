require "./Piece"

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