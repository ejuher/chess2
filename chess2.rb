require './pieces'

class Board
  attr_reader :rows

  def initialize
    setup_board
  end

  def setup_board
    @rows = Array.new(8) { Array.new(8) }

    [:white, :black].each do |color|
      place_pawns(color)
      place_royalty(color)
    end
  end

  def place_pawns(color)
    color == :white ? row = 1 : row = 6
    (0..7).each do |col|
      @rows[row][col] = Pawn.new(@rows, [row, col], color)
    end
  end

  def place_royalty(color)
    color == :white ? row = 0 : row = 7
      @rows[row][0] = Rook.new(@rows, [row, 0], color) 
      @rows[row][1] = Knight.new(@rows, [row, 1], color) 
      @rows[row][2] = Bishop.new(@rows, [row, 2], color) 
      @rows[row][3] = Queen.new(@rows, [row, 3], color)
      @rows[row][4] = King.new(@rows, [row, 4], color)
      @rows[row][5] = Bishop.new(@rows, [row, 5], color)
      @rows[row][6] = Knight.new(@rows, [row, 6], color)
      @rows[row][7] = Rook.new(@rows, [row, 7], color)
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
  end

  def move(start, end_pos)
  end
  
  #return a 1d array of all pieces on the board
  def all_pieces
    rows.flatten.compact
  end
  
  def dup
    board_copy = rows.dup
    all_pieces.each do |piece|
      piece_copy = piece.dup
      piece_copy.position = piece.position.dup
      board_copy[piece.position[0]][piece.position[1]] = piece_copy
    end
    
    board_copy.flatten.compact.each do |copied_piece|
      copied_piece.board = board_copy
    end
  end
end

b = Board.new
p b
p b.rows[0][4].moves
