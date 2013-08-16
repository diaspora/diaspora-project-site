DiasporaProjectSite::Application.routes.draw do
  devise_for :users

  constraints subdomain: /^(|www)$/i do
    get 'about' => 'pages#about'
    get 'get_involved' => 'pages#get_involved'

    get 'switch_locale/:locale' => 'i18n#switch_locale', as: :switch_locale

    root to: 'pages#index'
  end

  constraints subdomain: /^admin$/i do
    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end

  constraints subomdain: /^blog$/i do
    resources :blog, path: '/', only: [:index, :show]
  end
end
