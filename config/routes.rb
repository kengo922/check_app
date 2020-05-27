Rails.application.routes.draw do
  root to: 'softwares#new'
  resources :softwares do  
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
