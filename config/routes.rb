Rails.application.routes.draw do

  devise_for :users
  root :to => 'main#view'
  
  match ":controller(/:action(/:id))", :via => [:post, :get]
  
end
