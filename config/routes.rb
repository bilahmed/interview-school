Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "sections#index"

  resources :sections

  resources :students, only: %i[] do
    collection do
      get :schedule
      post :add_section
      delete :remove_section
    end
  end
end
