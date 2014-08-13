require "./SlidingPiece"

class Bishop < SlidingPiece
  def deltas
    [-1, 1].product([-1, 1])
  end
  
  def to_c
    "b"
  end
end