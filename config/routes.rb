Yrs2011Rails::Application.routes.draw do
  resources :patients do
    
    resources :prescriptions
    
    resources :maps
    
    resources :gps do
      resources :bookings
    end
    
    resources :static
  end
  
  match '/qrcode/:id/:signed_id' => 'qrcode#show'
  
  match '/patients/:patient_id/drugs' => 'drugs#show'
  
  root :to => 'static#index', :patient_id => 1
  
  match '/patients/:patient_id/history' => 'static#patient_history'
  
  match '/geocode' => 'geocode#show'
end
