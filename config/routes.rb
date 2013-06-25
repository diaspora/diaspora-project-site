DiasporaProjectSite::Application.routes.draw do
  devise_for :users

  constraints :subdomain => /^(|www)$/i do
    match 'about' => 'pages#about'
    match 'get_involved' => 'pages#get_involved'

    root :to => 'pages#index'
  end

  constraints :subdomain => /^admin$/i do
    mount RailsAdmin::Engine => '/', :as => 'rails_admin'
  end

  constraints :subomdain => /^blog$/i do
    resources :blog, :path => '', :only => [:index, :show]
  end
end
