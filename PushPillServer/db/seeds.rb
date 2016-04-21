# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin::Manager.create(email: 'admin@admin.com', password: '12345678')

app = Rpush::Apns::App.new
app.name = "ios_app"
app.certificate = File.read(File.join(Rails.root, "ck.pem"))
app.environment = "sandbox" # APNs environment.
app.password = "1234qwer"
app.connections = 1
app.save!