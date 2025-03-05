Rails.application.routes.draw do

  # Auth Routes
  post "/register", to: "users#register"
  post "/login", to: "users#login"
  delete "/logout", to: "users#logout"
  get "/check_auth", to: "users#check_auth"
  post "/reset_password_request", to: "users#reset_password_request"
  post "/reset_password", to: "users#reset_password"

  # Custom Doctors Routes (must come before 'doctors/:id' to avoid conflicts)
  get 'doctors/popular',   to: 'doctors#popular'
  get 'doctors/featured',  to: 'doctors#featured'
  get 'doctors/by_career', to: 'doctors#by_career'
  get 'doctors/favorites', to: 'doctors#favorites'

  # Standard RESTful Doctors Routes
  get    'doctors',       to: 'doctors#index'
  get    'doctors/:id',   to: 'doctors#show'
  post   'doctors',       to: 'doctors#create'
  put    'doctors/:id',   to: 'doctors#update'
  delete 'doctors/:id',   to: 'doctors#destroy'
  
  # Patients Routes
  get    'patients',          to: 'patients#index'
  get    'patients/:id',      to: 'patients#show'
  post   'patients',          to: 'patients#create'
  put    'patients/:id',      to: 'patients#update'
  delete 'patients/:id',      to: 'patients#destroy'

  # Medical Records Routes
  get    'medical_records',   to: 'medical_records#index'
  get    'medical_records/:id', to: 'medical_records#show'
  post   'medical_records',   to: 'medical_records#create'
  put    'medical_records/:id', to: 'medical_records#update'
  delete 'medical_records/:id', to: 'medical_records#destroy'

  # Appointments Routes
  get    'appointments',      to: 'appointments#index'
  get    'appointments/:id',  to: 'appointments#show'
  post   'appointments',      to: 'appointments#create'
  put    'appointments/:id',  to: 'appointments#update'
  delete 'appointments/:id',  to: 'appointments#destroy'

  # Diagnosis Offers Routes
  get    'diagnosis_offers',   to: 'diagnosis_offers#index'
  get    'diagnosis_offers/:id', to: 'diagnosis_offers#show'
  post   'diagnosis_offers',   to: 'diagnosis_offers#create'
  put    'diagnosis_offers/:id', to: 'diagnosis_offers#update'
  delete 'diagnosis_offers/:id', to: 'diagnosis_offers#destroy'
end
