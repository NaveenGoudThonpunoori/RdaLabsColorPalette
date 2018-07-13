Rails.application.routes.draw do
  root 'home#index'
  resources :home do
    collection do
      get 'leader_board'
    end
  end
  resources :grids do
    collection do
      post 'set_or_update_color'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
