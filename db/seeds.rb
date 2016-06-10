# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create :name => "admin", :email => "admin@example.com", :password => "test"

question1 = Question.create :question => "What is 852 + 9750?", :answer => "10602", :distractors => "5561, 7234, 2822, 6614"