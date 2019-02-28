Rails.application.routes.draw do




  # get 'gif/cool'
  # get 'gif/free'
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
  resources :new_photo_path



  delete '/logout',  to: 'sessions#destroy'

  get '/tour_options',  to: 'tours#tour_options'
  get '/booking_options',  to: 'bookings#booking_options'
  get '/review_options',  to: 'reviews#review_options'
  get '/photooptions', to: 'photooptions#index'

  get 'welcome/index'
  root :to => redirect('/welcome/index')
  

  # # This route sends requests to our naked url to the *cool* action in the *gif* controller.
  # root to: 'gif#cool'
  #
  # # I've created a gif controller so I have a page I can secure later.
  # # This is optional (as is the root to: above).
  # get '/cool' => 'gif#cool'
  # get '/sweet' => 'gif#sweet'




end
