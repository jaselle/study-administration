# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.find_by_email("mbeutel@uos.de")
	admin = User.create!(email: "mbeutel@uos.de", crypted_password: "123secretPW", crypted_password_confirmation: "123secretPW", role: "admin")
	admin.profile = Profile.create!(family_name: "Beutel", name: "Miriam")
	admin.save!
end
u = User.find_by_email("mbeutel@uos.de")
u.update_attributes!(role: "admin", crypted_password: "123secretPW", crypted_password_confirmation: "123secretPW")
