Rails.application.routes.draw do
  scope :mj do
    scope :v1 do
      resources :formats, only: [:index, :show] do
        collection do
          get 'han/:id', to: 'formats#han'
        end
      end
    end
  end
end
