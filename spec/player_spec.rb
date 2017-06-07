require 'rspec'
require 'player'

describe Player do
  let(:hand) {double ('hand')}
  subject(:player) {Player.new(hand)}

  describe '#initialize' do
    it 'assigns each player a hand and a pot' do
      expect(player.hand).to eq(hand)
      expect(player.pot).to eq(50)
    end
  end



end
