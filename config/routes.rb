Rails.application.routes.draw do




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings
  resources :bookmarks
  resources :sessions
  resources :agents
  resources :customers
  resources :options
  resources :customeroptions
  resources :agentoptions
  resources :tours
  resources :reviews
  resources :photos



  delete '/logout',  to: 'sessions#destroy'
  get 'welcome/index'
  root :to => redirect('/welcome/index')

 # GifVault::Application.routes.draw do

    # This route sends requests to our naked url to the *cool* action in the *gif* controller.
    root to: 'gif#cool'

    # I've created a gif controller so I have a page I can secure later.
    # This is optional (as is the root to: above).
    get '/cool' => 'gif#cool'
    get '/sweet' => 'gif#sweet'

    # These routes will be for signup. The first renders a form in the browse, the second will
    # receive the form and create a user in our database using the data given to us by the user.
    get '/signup' => 'users#new'
    post '/users' => 'users#create'

  end


