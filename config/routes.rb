Diasporaproject::Application.routes.draw do
  resources :contributors

  match 'get_involved' => 'pages#get_involved', :as => 'get_involved'
  match 'donate' => 'pages#donate', :as => 'donate'
  match 'donate_from_email' => 'pages#donate', :as => 'donate_from_email'
  match 'supporters' => 'pages#supporters', :as => 'supporters'
  match 'about' => 'pages#about', :as => 'about'
  match 'why_diaspora' => 'pages#why_diaspora', :as => 'why_diaspora'

  root :to => "pages#index"
end
