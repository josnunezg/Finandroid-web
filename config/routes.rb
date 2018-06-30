Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/, defaults: {locale: "es"} do
    devise_for :users, controllers: {
      confirmations: 'users/confirmations',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
    }

    resources :summaries
    resources :bank_accounts
    resources :categories
    resources :expenses
    resources :groups
    resources :salaries
    resources :profiles, only: [:show, :edit]

    root 'summaries#index'

  end

end
