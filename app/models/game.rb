#require 'deck.rb'
#require 'player.rb'

class Game
  attr_accessor :players, :dealer, :deck

  def initialize
    @players = []
    @dealer = []
    @deck = Deck.new
  end

  def deal(deck)
    self.players.each do |player|
      player.get_hand(deck)
    end
    self.dealer.each do |dealer|
      dealer.get_hand(deck)
    end
  end

end