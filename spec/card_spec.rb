require 'rspec'
require 'card'

describe Card do
  describe '#initialize' do
    it 'correctly assigns value from type' do
      card = Card.new('Ace', :spades)
      expect(card.value).to eq(14)
    end
  end

end
