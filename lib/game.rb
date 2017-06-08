require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'

class Game
  attr_reader :deck, :players, :pot

  def initialize(players = [Player.new('player1'), Player.new('player2')], pot = 0)
    @deck = Deck.new
    @players = players
    @player_1 = players[0]
    @player_2 = players[1]
    @pot = pot
    @current_player = players.first
  end

  def setup
    @players.each do |player|
      until player.hand.length == 5
        player.hand << deck.stack.shift
      end
    end
  end

  def bet_turn
    
  end

  def discard_turn
    players.length.times do
      @current_player.hand.render
      @current_player.get_discard
      system ('clear')
      @current_player.hand.render
      sleep 1
      puts "switch players!"
      sleep 2
      system('clear')
      switch_player!
    end
  end

  def switch_player!
    current_player == @player_1 ? @player_2 : @player_1
  end

  def take_turn
    system ('clear')
    @current_player.hand.render
    @current_player.get_discard
  end







end
