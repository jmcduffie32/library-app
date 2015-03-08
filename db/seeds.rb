# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.destroy_all
Genre.destroy_all
Author.destroy_all

scifi = Genre.create!(name: "Science Fiction")
fantasy = Genre.create!(name: "Fantasy")
non_fiction = Genre.create!(name: "Non-Fiction")

bill_bryson = Author.create!(name: "Bill Bryson")
stephen_king = Author.create!(name: "Stephen King")
william_gibson = Author.create!(name: "William Gibson")

Book.create!([{
	name: "One Summer",
	author: bill_bryson,
	description: "A fantastics book about 1927.",
	read: false,
	genre: non_fiction
	}])

Book.create!([{
	name: "The Gunslinger",
	author: stephen_king,
	description: "The first book in the dark tower series",
	read: true,
	genre: fantasy
	}])

Book.create!([{
	name: "Neuromancer",
	author: william_gibson,
	description: "The beginning of cyberpunk",
	read: true,
	genre: scifi
	}])

puts "Created #{Book.count} books"