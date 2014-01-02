class Card
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = %w(Spade Heart Club Diamond)

  attr_accessor :rank, :suit
  
  def initialize(id)
    self.rank = RANKS[id % 13]
    #self.suit = SUITS[id % 4]
    if id < DECKSIZE / SUITS.length
      self.suit = SUITS[0]
    elsif id < DECKSIZE / SUITS.length*2
      self.suit = SUITS[1]
    elsif id < DECKSIZE / SUITS.length*3
      self.suit = SUITS[2]
    else
      self.suit = SUITS[3]   
    end
  end
end