require "./SlidingPiece"

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