require 'rspec'
require 'deck'


describe Deck do
  subject(:deck) {Deck.new}

  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(deck.stack.length).to eq(52)
    end

    it 'shuffles the deck' do
      other_deck = Deck.new
      expect(other_deck.stack).to_not eq(deck.stack)
    end
  end

end
