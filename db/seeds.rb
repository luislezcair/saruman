# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
group = Group.create!(name: 'Tecnico', admin: false)
# User.create!(firstname: 'Admin', lastname: 'Admin', email: 'admn@admin.com', username: 'admin', password: 'admin-123', group: group)
User.create!(firstname: 'Tecnico', lastname: 'Tecnico', email: 'tecnico@tecnico.com', username: 'tecnico', password: 'tecnico-123', group: group)
User.create!(firstname: 'Arturo', lastname: 'Suarez', email: 'arturo@tecnico.com', username: 'Arturo', password: 'test-123', group: group)
User.create!(firstname: 'Nicole', lastname: 'Necochea', email: 'nicole@tecnico.com', username: 'Nicole', password: 'test-123', group: group)