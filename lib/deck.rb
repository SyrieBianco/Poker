require_relative 'card.rb'


class Deck

  SUITS = [:diamonds, :clubs, :hearts, :spades]
  TYPES = ['Ace', 'King', 'Queen', 'Jack', '10', '9', '8', '7', '6', '5', '4', '3', '2']

  def initialize
    @deck = []

    TYPES.each do |type|
      SUITS.each do |suit|
        @deck << Card.new(type, suit)
      end
    end

    @deck.shuffle!
  end


end
