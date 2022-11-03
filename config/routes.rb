Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/customer/subscriptions', to: 'subscriptions#index'
    end 
  end 
end
