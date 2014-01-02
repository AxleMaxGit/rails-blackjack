#require 'card.rb'

DECKSIZE = 52

class Deck

  attr_accessor :cards

  def initialize
    self.cards = (0..(DECKSIZE-1)).to_a.shuffle.map { |id| Card.new(id) }
  end

  def inspect_deck
    self.cards.each do |card|
      puts card.inspect
    end
  end
end