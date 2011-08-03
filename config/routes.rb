Yrs2011Rails::Application.routes.draw do
  resources :patients do
    resources :prescriptions
    
    resources :gps do
      resources :bookings
    end
  end
  resources :maps
  
  match '/qrcode/:id/:signed_id' => 'qrcode#show'
  
  match '/patients/:patient_id/drugs' => 'drugs#show'
  
  root :to => 'prescriptions#index'
end
