class Profile < ActiveRecord::Base
	validates_presence_of :family_name, :name
	belongs_to :user, :foreign_key => 'user_id'

	accepts_nested_attributes_for :user
	# accepts_nested_attributes_for :events_users


end
