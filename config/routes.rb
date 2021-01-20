Rails.application.routes.draw do
  namespace :mj do
    namespace :v1 do
      resources :formats, only: [:index, :show] do
        collection do
          get 'han/:id', to: 'formats#han'
        end
      end
    end
  end
end