Blackjack::Application.routes.draw do
  
  root :to => "blackjack#index"

  get '/games', to: 'games#new'

  get '/blackjack', to: 'blackjack#index', as: 'blackjack'

  get '/blackjack/nextcard', to: 'blackjack#take_card', as: 'take_card'


end
