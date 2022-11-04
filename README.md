# Tea Subscription API

## About: 
Tea subscription is a simple Restful API, built in Ruby on Rails, that has three end points that allow customers to subscribe to a tea subscription, cancel a subscription, and see all of a customer's tea subscriptions. 

## Local Setup 
This project requires:
 * `Ruby 2.7.4`
 * `Rails 5.2.8.1`
 
### Setup Steps
* Fork the repository
* Clone the repository
* Install gems and set up your database:
   * `bundle install`
   * `rails db:create`
   * `rails db:migrate`
   

## Endpoints 
### Create a new subscription for a customer 
* POST `/api/v1/subscriptions`
A successful request creates a new subscription in the database, and returns a 201 response when the subscription is created. 

* Example Response: 
``` 
  {
      "data": {
          "id": "4",
          "type": "subscriptions",
          "attributes": {
              "title": "Standard",
              "price": 7.74,
              "status": "Active",
              "frequency": "Full subscription",
              "tea_id": 1,
              "customer_id": 2
          }
      }
  }
```

