require 'rails_helper'

RSpec.describe "Subscriptions API" do 

    it 'has an index of a particular customers subscriptions' do 
        customer = create(:customer)
        customer_2 = create(:customer)
        tea = create(:tea)
        create_list(:subscription, 3, customer_id: customer.id, tea_id: tea.id)
        create_list(:subscription, 4, customer_id: customer_2.id, tea_id: tea.id)
       
        get "/api/v1/customer/#{customer.id}/subscriptions"

        subscriptions = JSON.parse(response.body, symbolize_names: true)
      
        expect(response).to be_successful
        expect(subscriptions).to be_a(Hash)
        expect(response.status).to eq(200)
        expect(response.status).to_not eq(404)
        
        expect(subscriptions[:data].count).to eq(3)
        expect(subscriptions[:data].count).to_not eq(4)

        expect(subscriptions[:data].first).to have_key(:id)
        expect(subscriptions[:data].first[:id]).to be_a(String)
        expect(subscriptions[:data].first[:attributes]).to have_key(:title)
        expect(subscriptions[:data].first[:attributes][:title]).to be_a(String)
        expect(subscriptions[:data].first[:attributes]).to have_key(:price)
        expect(subscriptions[:data].first[:attributes][:price]).to be_a(Float)
        expect(subscriptions[:data].first[:attributes]).to have_key(:status)
        expect(subscriptions[:data].first[:attributes][:status]).to be_a(String)
        expect(subscriptions[:data].first[:attributes]).to have_key(:frequency)
        expect(subscriptions[:data].first[:attributes][:frequency]).to be_a(String)
        expect(subscriptions[:data].first[:attributes]).to have_key(:tea_id)
        expect(subscriptions[:data].first[:attributes][:tea_id]).to be_a(Integer)
        expect(subscriptions[:data].first[:attributes]).to have_key(:customer_id)
        expect(subscriptions[:data].first[:attributes][:customer_id]).to be_a(Integer)

        expect(subscriptions[:data].first[:attributes]).to_not have_key(:created_at)
        expect(subscriptions[:data].first[:attributes]).to_not have_key(:updated_at)
    end 

    it 'can change the customers subscription status from active to cancelled' do 
        customer = create(:customer)
        tea = create(:tea)
        subscription = create(:subscription, customer_id: customer.id, tea_id: tea.id)
        
        expect(subscription.status).to eq("Active")
        
        patch "/api/v1/subscriptions", params: { subscription_id: subscription.id, status: "Canceled" }

        subscriptions = JSON.parse(response.body, symbolize_names: true)
        
        expect(response).to be_successful
        expect(subscriptions).to be_a(Hash)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(response.status).to_not eq(404)
        
        expect(subscriptions[:data]).to have_key(:id)
        expect(subscriptions[:data][:id]).to be_a(String)
        expect(subscriptions[:data][:attributes]).to have_key(:title)
        expect(subscriptions[:data][:attributes][:title]).to be_a(String)
        expect(subscriptions[:data][:attributes]).to have_key(:price)
        expect(subscriptions[:data][:attributes][:price]).to be_a(Float)
        expect(subscriptions[:data][:attributes]).to have_key(:status)
        expect(subscriptions[:data][:attributes][:status]).to eq("Canceled")
        expect(subscriptions[:data][:attributes]).to have_key(:frequency)
        expect(subscriptions[:data][:attributes][:frequency]).to be_a(String)
        expect(subscriptions[:data][:attributes]).to have_key(:tea_id)
        expect(subscriptions[:data][:attributes][:tea_id]).to be_a(Integer)
        expect(subscriptions[:data][:attributes]).to have_key(:customer_id)
        expect(subscriptions[:data][:attributes][:customer_id]).to be_a(Integer)
    end 

    it 'can create a new tea subscription for an existing customer' do 
        customer = create(:customer)
        tea = create(:tea)

        subscription_params = { 
                                title: "Standard",
                                price: 7.74,
                                status: "Active",
                                frequency: "Full subscription",
                                tea_id: tea.id,
                                customer_id: customer.id
                              }

        post "/api/v1/subscriptions", params: subscription_params
        
        new_subscription = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(new_subscription).to be_a(Hash)

        expect(response.status).to eq(201)
        expect(response.status).to_not eq(400)
                            
        expect(new_subscription[:data].count).to eq(3)
        expect(new_subscription[:data]).to have_key(:id) 
        expect(new_subscription[:data][:id]).to be_a(String) 
        expect(new_subscription[:data][:attributes]).to have_key(:title) 
        expect(new_subscription[:data][:attributes][:title]).to be_a(String) 
        expect(new_subscription[:data][:attributes]).to have_key(:price) 
        expect(new_subscription[:data][:attributes][:price]).to be_a(Float) 
        expect(new_subscription[:data][:attributes]).to have_key(:status) 
        expect(new_subscription[:data][:attributes][:status]).to be_a(String) 
        expect(new_subscription[:data][:attributes]).to have_key(:frequency) 
        expect(new_subscription[:data][:attributes][:frequency]).to be_a(String)          
        expect(new_subscription[:data][:attributes]).to have_key(:tea_id) 
        expect(new_subscription[:data][:attributes][:tea_id]).to be_a(Integer) 
        expect(new_subscription[:data][:attributes]).to have_key(:customer_id) 
        expect(new_subscription[:data][:attributes][:customer_id]).to be_a(Integer)                       
    end 
end 
