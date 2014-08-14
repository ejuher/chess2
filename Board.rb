require "./Pawn"
require "./King"
require "./Knight"
require "./Queen"
require "./Rook"
require "./Bishop"
require "./SteppingPiece"
require "./SlidingPiece"
require "./Piece"


class Board
  attr_accessor :rows
  
  def initialize(should_setup = true)
    @rows = Array.new(8) { Array.new(8) }
    setup_board if should_setup
  end
  
  def setup_board
    # @rows = Array.new(8) { Array.new(8) }

    [:white, :black].each do |color|
      # place_pawns(color)
      place_royalty(color)
    end
  end

  def place_pawns(color)
    color == :white ? row = 1 : row = 6
    (0..7).each do |col|
      @rows[row][col] = Pawn.new(self, [row, col], color)
    end
  end

  def place_royalty(color)
    row = color == :white ? 0 : 7
    @rows[row][0] = Rook.new(self, [row, 0], color) 
    @rows[row][1] = Knight.new(self, [row, 1], color) 
    @rows[row][2] = Bishop.new(self, [row, 2], color) 
    @rows[row][3] = Queen.new(self, [row, 3], color)
    @rows[row][4] = King.new(self, [row, 4], color)
    @rows[row][5] = Bishop.new(self, [row, 5], color)
    @rows[row][6] = Knight.new(self, [row, 6], color)
    @rows[row][7] = Rook.new(self, [row, 7], color)
  end
  
  def occupied?(color)
    
  end

  # def [](pos)
  #   row, col = pos
  #   @rows[row][col]
  # end
  
  # def []=(pos, value)
  #   row, col = pos
  #   @rows[row][col] = value
  # end
  
  def to_s
    @rows.map do |row|
      row.each do |space|
        if space.nil?
          "  "
        else
          space.to_s
        end
      end.join(' ') + "\n"
    end.reverse.join
  end

  def in_check?(color)
    king = all_pieces.select do |piece| 
      piece.is_a?(King) && piece.color == color 
    end.first

    all_pieces.each do |piece| 
      if piece.color != color && piece.moves.include?(king.pos) 
        return true
      end
    end
    
    false
  end

  def move(start, end_pos)
    
  end
  
  def force_move(start, end_pos)
    
    rows[end_pos[0]][end_pos[1]] = rows[start[0]][start[1]]
    rows[start[0]][start[1]].pos = end_pos
    rows[start[0]][start[1]] = nil
  end
  
  #return a 1d array of all pieces on the board
  def all_pieces
    rows.flatten.compact
  end
  
  def dup
    board_copy = self.class.new(false)
    # board_copy = self.dup
    all_pieces.each do |piece|

      piece_copy = piece.class.new(board_copy, piece.pos.dup, piece.color)
      board_copy.rows[piece.pos[0]][piece.pos[1]] = piece_copy
      
    end
    board_copy
  end
end

b = Board.new
p b

# b.all_pieces.each { |piece| puts piece.class }
p b.rows[0][4].move_into_check?([0,3])
# p b.in_check?(:white)
