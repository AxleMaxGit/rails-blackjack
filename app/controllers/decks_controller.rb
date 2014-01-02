class DecksController < ApplicationController
  
  #before_action :set_game, only: [:show, :index]

  def index
    
  end

  def show
  end

  def new
    @ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    @suits = %w(Spade Heart Club Diamond)

    Card.destroy_all

    @suits.each do |s|
      @ranks.each do |r|
        Card.create :cardrank => r, :cardsuit => s
      end
    end

    redirect_to :controller=>'games', :action=>'index'
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