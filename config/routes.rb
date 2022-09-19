Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'api/v1/visits#index'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      root 'visits#index'

      resources :visits
    end
  end
end
