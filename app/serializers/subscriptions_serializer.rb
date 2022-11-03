class SubscriptionsSerializer 
    include JSONAPI::Serializer
    attributes :title, :price, :status, :frequency, :tea_id, :customer_id
end 