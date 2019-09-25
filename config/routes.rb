Rails.application.routes.draw do
  resources :sessions
  get 'user/create'
  get 'user/destroy'
  post 'notes/create'
  post 'notes/update'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
