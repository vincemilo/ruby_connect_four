require_relative 'board.rb'
require_relative 'game.rb'

def play_game
  game = Game.new
  #game.board.display_board
  game.player_input
  #game.valid_move?(5)
  #game.next_open_row(5)
  # game.board.assign_nums
end

play_game