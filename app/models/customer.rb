class Customer < ApplicationRecord 
    validates_presence_of :first_name,
                          :last_name,
                          :email,
                          :address
    has_many :subscriptions
end 