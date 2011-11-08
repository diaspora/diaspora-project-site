Diasporaproject::Application.routes.draw do
  resources :contributors
  resources :donors, :only => :update

  match 'get_involved' => 'pages#get_involved', :as => 'get_involved'
  match 'donate' => 'pages#donate', :as => 'donate', :via => :get
  match 'donate' => 'pages#process_donation', :via => :post
  match 'donate_from_email' => 'pages#donate', :as => 'donate_from_email'
  match 'supporters' => 'pages#supporters', :as => 'supporters'
  match 'about' => 'pages#about', :as => 'about'
  match 'why_diaspora' => 'pages#why_diaspora', :as => 'why_diaspora'
  match 'pods' => 'pages#pods', :as => 'pods'
  match 'index_alt' => 'pages#index_alt', :as => 'index_alt'
  match 'media' => 'pages#media', :as => 'media'
  root :to => "pages#index"
end
