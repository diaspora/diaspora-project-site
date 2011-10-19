Diasporaproject::Application.routes.draw do
  resources :contributors
  resources :donors, :only => :create

  match 'get_involved' => 'pages#get_involved', :as => 'get_involved'
  match 'donate' => 'pages#donate', :as => 'donate', :via => :get
  match 'donate' => 'pages#process_donation', :via => :post
  match 'donate_from_email' => 'pages#donate', :as => 'donate_from_email'
  match 'supporters' => 'pages#supporters', :as => 'supporters'
  match 'about' => 'pages#about', :as => 'about'
  match 'why_diaspora' => 'pages#why_diaspora', :as => 'why_diaspora'

  root :to => "pages#index"
end
