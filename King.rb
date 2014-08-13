require "./SteppingPiece"
# require "./Piece"

class King < SteppingPiece
  def deltas
    [0,1,-1].product([0,1,-1]).drop(1)
  end
  
  def to_c
    "K"
  end
end