require_relative 'board.rb'
require_relative 'game.rb'

def play_game
  game = Game.new
  # game.board.display_board
  game.board.assign_hash
end

play_game