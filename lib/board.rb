# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, 0) }
  end

  def display_board
    puts 'Behold the board:'
    print "#{(1..7).to_a} \n"
    @board.each do |row|
      puts row.to_s
    end
  end

  def assign_nums
    range = (1..42).to_a
    num_board = []
    board.each do |row|
      num_board += row.map { range.shift }
    end
    p num_board
    # columns = num_board.transpose
    # p columns
  end
end
