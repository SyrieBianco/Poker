require 'rspec'
require 'player'

describe Player do
  let(:deck) { double(stack: ["card6", "card7"])}
  let(:hand) {["card1", "card2", "card3", "card4", "card5"]}
  subject(:player) {Player.new('Gary')}

  describe '#initialize' do
    it 'assigns each player a hand and a pot' do
      expect(player.name).to eq('Gary')
      expect(player.pot).to eq(50)
    end
  end

  # describe '#discard' do
  #   it 'discards the cards at the input indices' do
  #     player.hand += hand
  #     player.get_discard(deck)
  #     expect(player.hand).to eq(["card3", "card4", "card5", "card6", "card7"])
  #   end
  end
end
