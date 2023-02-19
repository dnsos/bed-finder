Rails.application.routes.draw do
  root "facilities#index"

  resources :facilities do
    get "vacancies", to: "vacancies#show"
    resources :occupancies, only: %i[index new create] do
      member { patch :terminate }
    end
  end
end
