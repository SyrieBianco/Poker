require_relative 'hand'

class Player

  attr_accessor :hand, :pot, :folded

  def initialize(hand, pot = 50)
    @hand = hand
    @pot = pot
    @bet = 0
    @folded = false
  end

  def get_discard(deck)
    puts "Which cards would you like to discard? ex) 3,4"
    indices = gets.chomp.split(",").map(&:to_i)
    indices.sort.reverse.each do |i|
      @hand.delete_at(i)
      @hand << deck.stack.shift
    end
  end

  def get_action(current_bet)
    puts "What would you like to do? (fold/see/raise)"
    action = gets.chomp

    case action
    when "see"
      @bet = current_bet
    when "raise"
      puts "How much would you like to raise by?"
      raise_amount = gets.chomp
      @bet += Integer(raise_amount)
    when "fold"
      @folded = true
    end
  end

end
