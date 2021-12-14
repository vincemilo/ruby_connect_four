# frozen_string_literal: true

class Game
  attr_reader :board, :turn, :game_over

  ROW_COUNT = 6
  COLUMN_COUNT = 7

  def initialize
    @board = Array.new(6) { Array.new(7, 0) }
    @turn = 0
    @game_over = false
  end

  def display_board
    puts 'Behold the board:'
    # print "#{(0..6).to_a} \n"
    @board.reverse.each do |row|
      puts row.to_s
    end
  end

  def player_input
    while @game_over == false
      if @turn.zero?
        puts 'Player 1 select your column (0-6):'
      else
        puts 'Player 2 select your column (0-6):'
      end
      column = gets.chomp.to_i
      check_input(column)
    end
  end

  def check_input(column)
    if valid_move?(column)
      row = get_next_open_row(column)
      drop_piece(column, row, @turn + 1)
    end

    display_board
    @turn += 1
    @turn %= 2
  end

  def drop_piece(column, row, piece)
    @board[row][column] = piece
  end

  def valid_move?(column)
    @board[5][column].zero?
  end

  def get_next_open_row(column)
    0.upto(ROW_COUNT - 1) do |i|
      return i if @board[i][column].zero?
    end
  end
end

# game = Game.new
# game.display_board
# game.player_input
