Yrs2011Rails::Application.routes.draw do
  resources :patients do
    
    resources :prescriptions
    
    resources :maps
    
    resources :gps do
      resources :bookings
    end
  end
  
  match '/qrcode/:id/:signed_id' => 'qrcode#show'
  
  match '/patients/:patient_id/drugs' => 'drugs#show'
  
  root :to => 'prescriptions#index', :patient_id => 1
  
  match '/geocode' => 'geocode#show'
end
