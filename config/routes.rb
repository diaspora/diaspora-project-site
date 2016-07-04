Rails.application.routes.draw do
  devise_for :users

  get 'switch_locale/:locale' => 'i18n#switch_locale', as: :switch_locale

  constraints subdomain: /^(|www)$/i do
    controller :pages do
      get :about
      get :formatting
      get :get_involved
      get :other_docs
      get :tips
      get :tutorials
      scope 'getting_started' do
        get :aspects, action: 'getting_started3'
        get :connecting, action: 'getting_started4'
        get :conversations, action: 'getting_started6'
        get :finishing, action: 'getting_started7'
        get :interface, action: 'getting_started2'
        get :sharing, action: 'getting_started5'
        get :sign_up, action: 'getting_started1'
      end
    end

    root to: 'pages#index'
  end

  constraints subdomain: /^admin$/i do
    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end

  constraints subdomain: /^blog$/i do
    get 'feed' => 'blog#feed', :as => :news_feed, :defaults => {:format => :atom}
    resources :blog, path: '/', only: [:index, :show]
  end

  constraints subdomain: /^planet$/i do
    get 'feed' => 'planet#feed', :as => :planet_feed, :defaults => {:format => :atom}
    get '/' => 'planet#index', :as => :planet_index
  end
end
