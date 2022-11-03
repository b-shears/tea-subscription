require 'rails_helper'


RSpec.describe "Subscriptions API" do 

    it 'has an index of one customers subscriptions' do 
        customer_1 = create(:customer)
        customer_2 = create(:customer)
        tea = create(:tea)
        create_list(:subscription, 3, customer_id: customer_1.id, tea_id: tea.id)
        create_list(:subscription, 4, customer_id: customer_2.id, tea_id: tea.id)

        get '/api/v1/customer/subscriptions', params: { customer: customer_1.id}

        expect(response).to be_successful 

        customers = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
    end 
end 