require 'rspec'
require 'hand'

describe Hand do
  let(:card_A) { double('card_A', type: 'Ace', value: 14) }
  let(:card_2) { double('card_2', type: '2', value: 2) }
  subject(:hand) {Hand.new([card_A, card_A, card_A, card_2, card_2])}
  subject(:other_hand) {Hand.new([card_A, card_A, card_2, card_2, card_2])}

  describe '#initialize' do
    it 'generates a hand of 5 cards' do
      expect(hand.cards.length).to eq(5)
    end
  end

  describe '#evaluate' do
    it 'correctly returns type of hand and type value' do
      expect(hand.evaluate).to eq([:full_house, "Ace"])
      expect(other_hand.evaluate).to eq([:full_house, "2"])
    end
  end

  describe '#<=>' do
    it 'correctly compares a smaller hand to a larger hand' do
      expect(other_hand <=> hand).to eq(-1)
    end

    it 'correctly compares a larger hand to a smaller hand' do
      expect(hand <=> other_hand).to eq(1)
    end

    it 'correctly compares two equal hands' do
      expect(hand <=> hand).to eq(0)
    end
  end

end
