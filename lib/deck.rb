require_relative 'card.rb'


class Deck
  attr_reader :stack

  SUITS = [:diamonds, :clubs, :hearts, :spades]
  TYPES = ['Ace', 'King', 'Queen', 'Jack', '10', '9', '8', '7', '6', '5', '4', '3', '2']

  def initialize
    @stack = []

    TYPES.each do |type|
      SUITS.each do |suit|
        @stack << Card.new(type, suit)
      end
    end

    @stack.shuffle!
  end



end
