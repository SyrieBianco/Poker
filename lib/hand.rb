require_relative 'card'

class Hand
  attr_reader :cards

  HAND_RANKS = %i(
    high_card
    one_pair
    two_pair
    triple straight
    flush
    full_house
    quadruple
    straight_flush)

  def initialize(cards)
    @cards = cards
  end

  def evaluate
    if of_a_kind_hands
      of_a_kind_hands
    elsif five_card_hands
      five_card_hands
    else
      high_card
    end
  end

  def <=> (other_hand)
    hand_rank = HAND_RANKS.index(evaluate[0])
    other_hand_rank = HAND_RANKS.index(other_hand.evaluate[0])

    case hand_rank <=> other_hand_rank
    when -1
      -1
    when 1
      1
    when 0
      Card::VALUES[evaluate[1]] <=> Card::VALUES[other_hand.evaluate[1]]
    end
  end

  private

  def card_count
    counts = Hash.new(0)
    @cards.each do |card|
      counts[card.type] += 1
    end
    counts.select {|k, v| v > 1}.sort_by {|k, v| -v}
  end

  def of_a_kind_hands
    counts = card_count
    count_values = counts.map {|k, v| v}
    max_count_value = count_values.max
    max_type = counts[0][0]

    case max_count_value
    when 4
      [:quadruple, max_type]
    when 3
      count_values.length == 2 ? [:full_house, max_type] : [:triple, max_type]
    when 2
      #what happens when two people have same 2 pair high value?
      count_values.length == 2 ? [:two_pair, max_type] : [:one_pair, max_type]
    else
      nil
    end
  end

  def five_card_hands
    max_type = high_card[1]

    if is_straight? && is_flush?
      [:straight_flush, max_type]
    elsif is_straight?
      [:straight, max_type]
    elsif
      [:flush, max_type]
    else
      nil
    end
  end

  def is_straight?
    card_values = @cards.map{|card| card.value}.sort
    # will &:value work for that block?
    card_values.last - card_values.first == 4
  end

  def is_flush?
    @cards.map {|card| card.suit}.all? {|c_suit| c_suit == cards[0].suit}
  end

  def high_card
    max_type = @cards.sort_by {|card| -card.value}.first.type
    [:high_card, max_type]
  end

end
