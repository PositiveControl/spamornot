# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "admin@example.com", password: "123456", role: :admin)
User.create(email: "user@example.com", password: "123456", role: :user)
User.create(email: "editor@example.com", password: "123456", role: :editor)
editor_user = User.create(email: "editor2@example.com", password: "123456", role: :editor)
Article.create(title: "", content: "In the past two trading days, Nikola has seen a 22% rise in share price.", category: "Market", user: editor_user)

