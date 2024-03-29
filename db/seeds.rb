# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




['admin', 'user'].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'Admin User'
user = User.find_or_create_by_email :first =>'admin'.dup, :email => 'admin@abc.com'.dup, :password => 'admin123'.dup, :password_confirmation => 'admin123'.dup
puts 'user: ' << user.first

 