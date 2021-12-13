require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#place' do
    before do
      allow(game).to receive(:placed)
    end

    it 'places a circle on the board' do
      expect(game.place(1)).to receive(:placed)
    end
  end
end