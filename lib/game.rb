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

    if winning_move?(1) == true
      puts 'Player 1 wins!'
      @game_over = true
    end

    display_board
    @turn += 1
    @turn %= 2
  end

  def drop_piece(column, row, piece)
    @board[row][column] = piece
  end

  def valid_move?(column)
    @board[ROW_COUNT - 1][column].zero?
  end

  def get_next_open_row(column)
    0.upto(ROW_COUNT - 1) do |row|
      return row if @board[row][column].zero?
    end
  end

  def winning_move?(piece)
    # check horiztonal
    0.upto(COLUMN_COUNT - 3) do |column|
      0.upto(ROW_COUNT - 1) do |row|
        # p [row, column]
        # p @board[row][column]
        return true if @board[row][column] == piece &&
                       @board[row][column + 1] == piece &&
                       @board[row][column + 2] == piece &&
                       @board[row][column + 3] == piece
      end
    end
  end
end

game = Game.new
game.display_board
game.player_input
