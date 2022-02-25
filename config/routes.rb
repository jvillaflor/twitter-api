Rails.application.routes.draw do
  apipie
  namespace :api do
    post "tweets/temperatures", to: "tweets#temperatures" 
    resources :things
  end
end
