Rails.application.routes.draw do
  resources :csv_files do 
    member do
      get 'modified_csv'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "csv_files#index"
end
