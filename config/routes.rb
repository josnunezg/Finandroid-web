Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/, defaults: {locale: "es"} do
    devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    resources :summaries, except: [:show] do
      member do
        put :share
      end
    end
    resources :bank_accounts
    resources :categories
    resources :expenses
    resources :groups, except: [:index] do
      member do
        get :accept_invitation
        get :invite_users
        put :send_invitation
      end
    end
    resources :salaries
    resources :profiles, only: [:show, :edit, :update]

    namespace :api do
      resources :bank_accounts
      get :login, to: 'application#login'
    end

    root 'summaries#index'

  end

end
