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

        expect(subscriptions[:data].first[:attributes]).to_not have_key(:create_at)
        expect(subscriptions[:data].first[:attributes]).to_not have_key(:updated_at)
    end 
end 