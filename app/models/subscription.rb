class Subscription < ApplicationRecord
    validates_presence_of :title 
    validates_presence_of :price 
    validates_presence_of :status 
    validates_presence_of :frequency 
    belongs_to :tea 
    belongs_to :customer
end