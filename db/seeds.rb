# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.find_by_email("mbeutel@uos.de")
	admin = User.create!(email: "mbeutel@uos.de", password: "123secretPW", password_confirmation: "123secretPW", role: "admin")
	admin.profile = Profile.create!(family_name: "Beutel", name: "Miriam")
	admin.save!
end

Course.import("Courses.csv")
Block.import("Blocks.csv")
Event.import("Events.csv")