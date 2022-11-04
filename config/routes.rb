Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get "/customer/:customer_id/subscriptions", to: "subscriptions#index"
      post "/subscriptions", to: "subscriptions#create"
    end 
  end 
end
