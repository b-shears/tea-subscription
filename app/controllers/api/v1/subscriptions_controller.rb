class Api::V1::SubscriptionsController < ApplicationController 
    def index 
        binding.pry
        customer = Customer.find(params[:customer_id])

        render json: SubscriptionsSerializer.new(customer.subscriptions)
    end 



    private 

    def subscription_params 
        params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
    end 
end 