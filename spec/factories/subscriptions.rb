FactoryBot.define do
    factory :subscription do 
        title { Faker::Subscription.plan }
        price { Faker::Commerce.price  }
        status { "Active" }
        frequency { Faker::Subscription.payment_term }
    end 
end 