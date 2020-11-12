# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "user@example.com", password: "123456", role: :user)
editor_user = User.create(email: "editor@example.com", password: "123456", role: :editor)
User.create(email: "editor2@example.com", password: "123456", role: :editor)
Article.create(title: "Shares on the rise!", content: "In the past two trading days, Nikola has seen a 22% rise in share price.", category: "Market", user: editor_user)
Article.create(title: "Shares tumble", content: "In the past two trading days, Nikola has seen a 6% fall in share price.", category: "Market", user: editor_user)
Article.create(title: "Shares steady on news", content: "In the past two trading days, Nikola has seen a 0.1% rise in share price.", category: "Market", user: editor_user)
Article.create(title: "Market rallies on news", content: "In the past two trading days, Nikola has seen a 40.1% rise in share price.", category: "Market", user: editor_user)
Article.create(title: "Badger to be released next week!", content: "Next week we will be releasing the Badger for public purchase.", category: "Products", user: editor_user)
Article.create(title: "Tre deliveries triple!", content: "Tre deliveries have tripled in the last 6 months.", category: "Products", user: editor_user)
Article.create(title: "Two becomes best selling truck in US", content: "Over the past year, Nikola's Two has been the best selling truck in the US.", category: "Products", user: editor_user)
Article.create(title: "Two receives honors in EU", content: "EU commission of lauries says Nikola has the best one ever.", category: "Products", user: editor_user)
