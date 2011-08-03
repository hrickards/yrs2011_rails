Yrs2011Rails::Application.routes.draw do
  resources :prescriptions
  resources :maps

  resources :gps do
    resources :bookings
  end
  
  match '/qrcode/:id/:signed_id' => 'qrcode#show'
  
  match '/drugs' => 'drugs#show'
  
  root :to => 'prescriptions#index'
end
