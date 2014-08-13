
class Knight < SteppingPiece
  def deltas
    [1,-1].product([2,-2]) + [2,-2].product([1,-1])
  end
  
  def to_c
    "k"
  end
end