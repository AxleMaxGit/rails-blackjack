class BlackjackController < ApplicationController
  
  def index
    @game1 = Game.new

    @game1.players[0] = Player.new("Alex", false)
    @game1.players[1] = Player.new("Clare", false)
    @game1.dealer[0] = Dealer.new("Dealer", true)

    @game1.deal(@game1.deck)
  end

end