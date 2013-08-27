DiasporaProjectSite::Application.routes.draw do
  devise_for :users

  get 'donate' => 'pages#donate'

  get 'switch_locale/:locale' => 'i18n#switch_locale', as: :switch_locale

  constraints subdomain: /^(|www)$/i do
  	controller :pages do
	    get :about
	    get :get_involved
	    get :tutorials
	    scope 'getting_started' do
	    	get :sign_up, action: 'getting_started1'
	    	get :interface, action: 'getting_started2'
	    	get :aspects, action: 'getting_started3'
	    	get :connecting, action: 'getting_started4'
	    	get :sharing, action: 'getting_started5'
	    	get :conversations, action: 'getting_started6'
	    	get :finishing, action: 'getting_started7'
	    end
	    get :formatting
	    get :tips
	    get :other_docs
	  end

    root to: 'pages#index'
  end

  constraints subdomain: /^admin$/i do
    mount RailsAdmin::Engine => '/', as: 'rails_admin'
  end

  constraints subomdain: /^blog$/i do
    get 'feed' => 'blog#feed', :as => :news_feed, :defaults => {:format => :atom}
    resources :blog, path: '/', only: [:index, :show]
  end
end
