class GamesController < ApplicationController
  
  before_action :set_game, only: [:show, :index]

  def index
    @game1 = Game.new

    @game1.players[0] = Player.new("Alex", false)
    @game1.players[1] = Player.new("Clare", false)
    @game1.dealer[0] = Dealer.new("Dealer", true)

    @game1.deal(@game1.deck)
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
     @game = Game.new(game_params)
  end

  def update
  end

  def destroy
  end

  def set_game
      @game = Game.new
    end

  def game_params
      params.require(:game).permit(:players, :dealer, :deck)
    end

end