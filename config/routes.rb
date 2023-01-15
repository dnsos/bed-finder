Rails.application.routes.draw do
  root 'facilities#index'

  resources :facilities do
    resources :occupancies, only: %i[index new create] do
      member { patch :terminate }
    end
  end
end
