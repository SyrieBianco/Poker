class Card

attr_reader :type, :value, :suit

  VALUES = {
    'Ace' => 14,
    'King' => 13,
    'Queen' => 12,
    'Jack' => 11,
    '10' => 10,
    '9' => 9,
    '8' => 8,
    '7' => 7,
    '6' => 6,
    '5' => 5,
    '4' => 4,
    '3' => 3,
    '2' => 2
  }

  def initialize(type, suit)
    @type = type
    @value = VALUES[type]
    @suit = suit
  end

end
