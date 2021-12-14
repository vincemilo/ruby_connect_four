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
    context 'when column is open' do
      it 'returns true' do
        expect(game.valid_move?(3)).to be true
      end
    end

    context 'when column is full' do
      before do
        row = 0
        while row <= 5
          game.drop_piece(3, row, 1)
          row += 1
        end
      end

      it 'returns false' do
        expect(game.valid_move?(3)).to be false
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
end
