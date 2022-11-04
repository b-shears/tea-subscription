class Api::V1::SubscriptionsController < ApplicationController 
    def index   
        customer = Customer.find(params[:customer_id])
        render json: SubscriptionsSerializer.new(customer.subscriptions)
    end 

    def create 
        if Customer.find(params[:customer_id]) && Tea.find(params[:tea_id])
            render json: SubscriptionsSerializer.new(Subscription.create(subscription_params)), status: :created
        else 
            render status: 404 
        end 
    end 

    private 

    def subscription_params 
        params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
    end 
end 