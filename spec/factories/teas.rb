FactoryBot.define do
    factory :tea do 
        title { Faker::Tea.variety}
        description { Faker::Tea.type }
        temperature { Faker::Number.number(digits: 2)}
        brew_time { Faker::Number.binary(digits: 2) }
    end 
end 