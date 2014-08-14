requires "./Board"

class Game
	def initialize
		@board = Board.new
		@turn = :white
	end

	def run
	end

	def get_input
	end

	def process_input
	end

	def switch_turns
		@turn == :white ? :black : :white
	end
end

