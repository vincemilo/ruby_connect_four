# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#drop_piece' do
    row = 5

    before do
      column = 1
      player = 1
      game.drop_piece(column, row, player)
    end

    it 'places a piece on the board' do
      dropped_piece = [0, 1, 0, 0, 0, 0, 0]
      expect(game.board[row]).to eq(dropped_piece)
    end
  end

  describe '#valid_move?' do
    column = 3
    player = 1

    context 'when column is open' do
      it 'returns true' do
        expect(game.valid_move?(column)).to be true
      end
    end

    context 'when column is full' do
      before do
        row = 0
        while row <= 5
          game.drop_piece(column, row, player)
          row += 1
        end
      end

      it 'returns false' do
        expect(game.valid_move?(column)).to be false
      end
    end
  end

  describe '#get_next_open_row' do
    before do
      row = 0
      while row < 3
        game.drop_piece(3, row, 1)
        row += 1
      end
    end

    it 'returns the next open row' do
      expect(game.get_next_open_row(3)).to eq(3)
    end
  end

  describe '#check_horizontal' do
    player = 1

    before do
      column = 0
      row = 0
      while column < 4
        game.drop_piece(column, row, player)
        column += 1
      end
    end

    it 'checks for 4 pieces in a row horizontally' do
      player = 1
      expect(game.check_horizontal(player)).to be true
    end
  end

  describe '#check_vertical' do
    player = 2

    before do
      column = 4
      row = 0
      while row < 4
        game.drop_piece(column, row, player)
        row += 1
      end
    end

    it 'checks for 4 pieces in a row vertically' do
      expect(game.check_vertical(player)).to be true
    end
  end

  describe '#check_positive_diag' do
    player = 1

    before do
      column = 0
      row = 0
      while column < 4
        game.drop_piece(column, row, player)
        column += 1
        row += 1
      end
    end

    it 'checks for 4 pieces in a positive diagonal' do
      expect(game.check_positive_diag(player)).to be true
    end
  end

  describe '#check_negative_diag' do
    player = 2

    before do
      column = 6
      row = 0
      while column > 2
        game.drop_piece(column, row, player)
        column -= 1
        row += 1
      end
      game.display_board
    end

    it 'checks for 4 pieces in a negative diagonal' do
      expect(game.check_negative_diag(player)).to be true
    end
  end
end
