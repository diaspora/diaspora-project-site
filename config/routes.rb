DiasporaProjectSite::Application.routes.draw do
  devise_for :users

  constraints subdomain: /^(|www)$/i do
    get 'about' => 'pages#about'
    get 'get_involved' => 'pages#get_involved'
    get 'tutorials' => 'pages#tutorials'
    get 'getting_started1' => 'pages#getting_started1'
    get 'getting_started2' => 'pages#getting_started2'
    get 'getting_started3' => 'pages#getting_started3'
    get 'getting_started4' => 'pages#getting_started4'
    get 'getting_started5' => 'pages#getting_started5'
    get 'getting_started6' => 'pages#getting_started6'
    get 'getting_started7' => 'pages#getting_started7'
    get 'formatting' => 'pages#formatting'
    get 'tips' => 'pages#tips'
    get 'other_docs' => 'pages#other_docs'

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
