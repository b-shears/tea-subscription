# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
customer1 = Customer.create!(first_name: "Bryan", last_name: "Shears", email: "bryan@gmail.com", address: "123 Tea Street")
customer2 = Customer.create!(first_name: "Clara", last_name: "Sweet", email: "clara@gmail.com", address: "456 Coffee Street")
tea1 = Tea.create!(title: "Oolang", description: "Good", temperature: 130, brew_time: "52")
tea2 = Tea.create!(title: "Green Tea", description: "Great", temperature: 120, brew_time: "21")
tea3 = Tea.create!(title: "Herbal", description: "Amazing", temperature: 105, brew_time: "17")
subscription1 = Subscription.create!(title: "Yearly", price: 30.00, status: "Active", frequency: "Monthly", customer_id: customer1.id, tea_id: tea1.id)
subscription2 = Subscription.create!(title: "Monthly", price: 30.00, status: "Cancelled", frequency: "Monthly", customer_id: customer1.id, tea_id: tea2.id)
subscription3 = Subscription.create!(title: "Weekly", price: 12.00, status: "Active", frequency: "Weekly", customer_id: customer1.id, tea_id: tea3.id)










