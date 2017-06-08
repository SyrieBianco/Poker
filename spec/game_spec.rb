require 'rspec'
require 'game'



describe Game do
  let(:deck) { double('deck') }
  let(:pot) { double('pot') }
  subject(:game) {Game.new}

  describe '#initialize' do
    it 'initializes with a deck, players, and a pot' do
      expect(game.pot).to eq(0)
    end
  end



end
