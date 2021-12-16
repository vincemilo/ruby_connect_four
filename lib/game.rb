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
    print "#{(1..7).to_a} \n"
    @board.reverse.each do |row|
      puts row.to_s
    end
  end

  def player_input
    while @game_over == false
      if @turn.zero?
        puts 'Player 1 select your column (1-7):'
      else
        puts 'Player 2 select your column (1-7):'
      end
      column = gets.chomp.to_i
      check_input(column - 1)
    end
  end

  def check_input(column)
    piece = @turn + 1

    if valid_move?(column)
      row = get_next_open_row(column)
      drop_piece(column, row, piece)
      display_board
      @turn += 1
      @turn %= 2
    end

    return game_end if winning_move?(piece)
  end

  def game_end
    display_board
    @turn.zero? ? (puts 'Player 1 wins!') : (puts 'Player 2 wins!')
    @game_over = true
  end

  def drop_piece(column, row, piece)
    @board[row][column] = piece
  end

  def valid_move?(column)
    if column > 6 || column.negative? || column =~ /\D/ ||
       @board[ROW_COUNT - 1][column].nil?
      puts 'Invalid entry, please try again.'
    else
      @board[ROW_COUNT - 1][column].zero?
      p @board[ROW_COUNT - 1].to_s
    end
  end

  def get_next_open_row(column)
    0.upto(ROW_COUNT - 1) do |row|
      return row if @board[row][column].zero?
    end
  end

  def winning_move?(piece)
    [check_horizontal(piece), check_vertical(piece), check_positive_diag(piece),
     check_negative_diag(piece)].any? { |e| e == true }
  end

  def check_horizontal(piece)
    0.upto(COLUMN_COUNT - 3) do |column|
      0.upto(ROW_COUNT - 1) do |row|
        return true if @board[row][column] == piece &&
                       @board[row][column + 1] == piece &&
                       @board[row][column + 2] == piece &&
                       @board[row][column + 3] == piece
      end
    end
  end

  def check_vertical(piece)
    0.upto(COLUMN_COUNT - 1) do |column|
      0.upto(ROW_COUNT - 4) do |row|
        return true if @board[row][column] == piece &&
                       @board[row + 1][column] == piece &&
                       @board[row + 2][column] == piece &&
                       @board[row + 3][column] == piece
      end
    end
  end

  def check_positive_diag(piece)
    0.upto(COLUMN_COUNT - 4) do |column|
      0.upto(ROW_COUNT - 4) do |row|
        return true if @board[row][column] == piece &&
                       @board[row + 1][column + 1] == piece &&
                       @board[row + 2][column + 2] == piece &&
                       @board[row + 3][column + 3] == piece
      end
    end
  end

  def check_negative_diag(piece)
    0.upto(COLUMN_COUNT - 4) do |column|
      2.upto(ROW_COUNT - 1) do |row|
        return true if @board[row][column] == piece &&
                       @board[row - 1][column + 1] == piece &&
                       @board[row - 2][column + 2] == piece &&
                       @board[row - 3][column + 3] == piece
      end
    end
  end
end

game = Game.new
# game.display_board
# game.player_input

player = 1
column = 0
row = 0
while row < 6
  game.drop_piece(column, row, player)
  row += 1
end

game.display_board
game.valid_move?(0)
