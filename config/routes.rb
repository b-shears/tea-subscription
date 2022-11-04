Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get "/customer/:customer_id/subscriptions", to: "subscriptions#index"
      put "/customer/:customer_id/subscriptions", to: "subscriptions#update"
    end 
  end 
end
