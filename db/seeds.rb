# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(
email:'bob@mail.com',
password:'qwertyuio',
password_confirmation: 'qwertyuio',
first_name: 'Bob',
last_name: 'Smith',
office_location: 'London',
role: 'user' ) unless User.where(email: 'bob@mail.com').exists?

User.create!(
email:'jgc@mail.com',
password:'123456789',
password_confirmation: '123456789',
first_name: 'Jacob',
last_name: 'G-C',
office_location: 'Bristol',
role: 'admin' ) unless User.where(email: 'jgc@mail.com').exists?

Device.create!(
device_name: 'test121',
device_type: 'Phone',
device_cost: '123.10',
device_model: '6S',
device_manufacturer: 'Apple',
user_id: '1')
