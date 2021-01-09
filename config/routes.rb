Rails.application.routes.draw do
  scope :mj do
    scope :v1 do
      resources :formats, only: [:index, :show]
    end
  end
end
