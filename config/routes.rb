Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'games#index'
  get '/new_game', to: 'games#create'
  get '/guess/:game_id/:x/:y', to: 'games#guess'
  get '/surprise', to: 'games#egg'
  get '/stats', to: 'games#stats'

end
