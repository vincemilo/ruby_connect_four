# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def display_board
    puts 'Behold the board:'
    puts '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
    @board.each do |row|
      puts row.to_s
    end
  end

  def assign_hash
    range = (1..42).to_a
    board.each do |row|
      row.map! { range.shift }
    end
    p @board
    # column = board.transpose
    # p range
    # p column
    # column.each do |row|
    #   row.each do |cell|
    #     p cell
    #   end
    # end
    # p column
  end
end