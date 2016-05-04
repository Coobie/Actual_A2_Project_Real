
#Users
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

#Devices
Device.create(device_name: 'Galaxy',device_type: 'Phone',device_cost: '430.10',device_model: 'S6',device_manufacturer: 'Samsung',expiry_date: '2016-06-01',start_date: '2015-07-01',user_id: '2')
Device.create(device_name: 'Galaxy',device_type: 'Phone',device_cost: '430.10',device_model: 'S6',device_manufacturer: 'Samsung',expiry_date: '2016-06-01',start_date: '2015-07-01',user_id: '3')
Device.create(device_name: 'Note4',device_type: 'Phone',device_cost: '399.00',device_model: 'Note 4',device_manufacturer: 'Samsung',expiry_date: '2016-06-23',start_date: '2015-06-23',user_id: '1')
