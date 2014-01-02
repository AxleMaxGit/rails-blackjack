class CardsController < ApplicationController
  
  #before_action :set_game, only: [:show, :index]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end