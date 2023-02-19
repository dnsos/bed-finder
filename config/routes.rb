Rails.application.routes.draw do
  root "facilities#index"

  namespace :api do
    namespace :v1 do
      resources :facilities, only: %i[show] do
        get "vacancies", to: "vacancies#index"
      end
    end
  end

  resources :facilities do
    get "vacancies", to: "vacancies#index"
    resources :occupancies, only: %i[index new create] do
      member { patch :terminate }
    end
  end
end
