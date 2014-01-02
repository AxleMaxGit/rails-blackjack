class GamesController < ApplicationController
  
  #before_action :set_game, only: [:show, :index]

  def index
    #validate or build astandard deck of 52 cards
    if Card.all.length != 52
      Card.destroy_all
      build_base_deck
    end
    @base_deck = Card.all
    @games = Game.all
    @allplayers = Player.all
    @game_players = GamePlayer.all
  end

  def new
    #instantialtes a game and goves it an ID to reference
    #sets players for this round of play
    @allplayers = Player.all
    #TODO make this a selected param rather than random
    @players = @allplayers.sample(2)
    @game = Game.create()
    set_game_players(@game, @players)
    redirect_to game_path(@game)
  end

  def set_game_players(game, players)
    players.each do |p|
      GamePlayer.create :game_id => @game.id, :player_id => p.id
    end
  end

  def show
    #load the base deck. A plain deck of 52 unshuffled cards
    @base_deck = Card.all
    #build a shuffled deck of cards for this round. Oad into the database
    build_game_deck
    #load the game deck from db to memory
    @current_game_deck = GameDeck.where(game_id: params[:id])
    #load all players to be queried for name.
    @allplayers = Player.all
    #Load the players for the round
    #@current_game_players = Game.where(id: params[:id])[0].players
    @current_game_players = GamePlayer.where(game_id: params[:id])
    
    #this if statement prevents taking more cards on page reload
    if Hand.where(game_id: params[:id]).empty?
      #deal starting hands, to each player, using the game deck, 2 cards to start
      #(for each player, from the current_gmae_deck, issue x cards)
      get_card(@current_game_players, @current_game_deck, 2)
    end

    @hands = Hand.where(game_id: params[:id])

    @pl_h = get_player_hands(@hands, @current_game_players)

  end

  def get_player_hands(round_hands, players)
    @player_hand = []
    players.each do |p|
      q = p[0].to_i
      @player_hand[q] = round_hands.where(player_id: q)
    end
    return @player_hand
  end

  def get_card(players, deck, cards_reqd)
    players.each_with_index do |val, index| 
      #take X cards from the deck
      cards_reqd.times do |c|
        #create cards for the hand in the db. All cards for each game are retrieved in the show action.
        #Hand belongs to a player. val[0] is the location of the player_id in the game.players array
        #Hand belongs to a game. params[:id] holds the game_id
        #Hand cards come from the gamedeck
        #TODO Hand has a hand ID because of the ability to split hands. 
        @hand_card = Hand.create :player_id => val.player_id,  :game_id => params[:id], :gamedeck_id => card_from_gamedeck, :hand_id => 1
      end
    end 
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

   def build_base_deck
    #builds an unshuffled reference deck of 52 cards
    @ranks = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    @suits = %w(Spade Heart Club Diamond)

    @suits.each do |s|
      @ranks.each do |r|
        v = card_rank_to_value(r)
        Card.create :cardrank => r, :cardsuit => s, :cardvalue => v
      end
    end
  end

  def card_rank_to_value(rank)
    card_value = 0
    if rank == "A" 
        card_value = 11
    elsif rank == "J" || rank == "Q" || rank == "K"
        card_value = 10 
    else
        card_value = rank.to_i
    end
    return card_value
  end

  def build_game_deck
    #ensure that only one deck is issued per game / show page load
    if GameDeck.all.empty? || GameDeck.all.last.game_id != params[:id].to_i
      #make a game specific, newly shuffled deck
      @gamedeck = Card.all.shuffle
      @gamedeck.each do |basedeck_card|
       GameDeck.create :basedeck_card_id => basedeck_card.id, :dealt => false, :game_id => params[:id]
      end
    else
    #if a deck exists for this game don't regenerate a new one  
      return
    end
  end

  def card_from_gamedeck
    #Retrieve the first card from gamedeck where dealt == false
    @card = GameDeck.where(dealt: false).last
    #get the card's gamedeck_id
    @gamedeck_id = @card.id
    #mark the retrieved cards as dealt in the GameDeck
    GameDeck.update(@gamedeck_id, :dealt => true)
    #return the 
    return @gamedeck_id
  end

end