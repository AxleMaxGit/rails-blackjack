#require 'hand.rb'


class Player
  attr_accessor :name, :hand, :is_dealer

  def initialize(name, is_dealer)
    @name = name
    @is_dealer = is_dealer
  end

  def get_hand(deck)
    @hand = Hand.new(deck)
  end

end