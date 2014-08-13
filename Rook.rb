require "./SteppingPiece"
# require "./Piece"

class Rook < SlidingPiece
  def deltas
    deltas = [[0,1], [0, -1]]
    deltas + deltas.map { |delta| delta.reverse }
  end
  
  def to_c
    "r"
  end
end