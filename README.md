# Tea Subscription API

## About 
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

### A subscription can be canceled. 
* PATCH `/api/v1/subscriptions`
A successful request cancels an an active subscription by changing the subscription status from active to cancelled, a 200 response should be returned when it's created. 

* Example Response: 

``` 
  {
      "data": {
          "id": "1",
          "type": "subscriptions",
          "attributes": {
              "title": "Yearly",
              "price": 30.0,
              "status": "Canceled",
              "frequency": "Monthly",
              "tea_id": 4,
              "customer_id": 3
          }
      }
  }

```

### List all of a customers subscriptions 
* GET `/api/v1/customer/:customer_id/subscriptions/`
A successful request list all of a customers subscriptions, a 200 response should be returned. 

* Example Response: 
```
   {
       "data": [
           {
               "id": "1",
               "type": "subscriptions",
               "attributes": {
                   "title": "Yearly",
                   "price": 30.0,
                   "status": "Active",
                   "frequency": "Monthly",
                   "tea_id": 4,
                   "customer_id": 3
               }
           },
           {
               "id": "2",
               "type": "subscriptions",
               "attributes": {
                   "title": "Monthly",
                   "price": 30.0,
                   "status": "Cancelled",
                   "frequency": "Monthly",
                   "tea_id": 5,
                   "customer_id": 3
               }
           },
           {
               "id": "3",
               "type": "subscriptions",
               "attributes": {
                   "title": "Weekly",
                   "price": 12.0,
                   "status": "Active",
                   "frequency": "Weekly",
                   "tea_id": 6,
                   "customer_id": 3
               }
           }
       ]
   }
   
```

###Schema 
![Screen Shot 2022-11-04 at 10 02 59 AM](https://user-images.githubusercontent.com/101689311/200021964-3984815d-d741-4543-87b4-c338e0d3da5d.png)




