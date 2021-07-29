# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'barack', email: 'barack@gmail.com', password: '123456', password_confirmation:'123456')
user2 = User.create(name: 'freddy', email: 'freddy@gmail.com', password: '123456', password_confirmation:'123456')

category1 = Category.create(name: 'Action')
Category.create(name: 'Biography')
category3 = Category.create(name: 'History')
category4 = Category.create(name: 'Horror')
Category.create(name: 'Kids')
Category.create(name: 'Learning')
Category.create(name: 'Sci-Fi')

Book.create(title: 'Harry Potter', user_id: user1.id, category_id: category3.id)
Book.create(title: 'Frankenstein', user_id: user2.id, category_id: category4.id)
Book.create(title: 'Make Me', user_id: user1.id, category_id: category1.id)
