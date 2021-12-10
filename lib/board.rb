# frozen_string_literal: true

class Board
  attr_reader :board

  FORWARD_COORDINATES = [
    [0, 0], [0, 1], [0, 2], [0, 3],
    [1, 0], [1, 1], [1, 2], [1, 3],
    [2, 0], [2, 1], [2, 2], [2, 3]
  ].freeze

  BACKWARD_COORDINATES = [
    [0, 3], [0, 4], [0, 5], [0, 6],
    [1, 3], [1, 4], [1, 5], [1, 6],
    [2, 3], [2, 4], [2, 5], [2, 6]
  ].freeze

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
  end

  def display_board
    puts 'Behold the board:'
    puts '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
    @board.each do |row|
      puts row.to_s
    end
  end
end

game = Board.new
game.display_board