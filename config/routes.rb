Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'user/:id', to: "users#show", as: "user"
  post 'user', to: "users#create", as: "create_user"
  put 'user/:id', to: "users#update", as: "update_user"
  delete 'user/:id', to: "users#destroy", as: "destroy_user"
end
