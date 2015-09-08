class Course < ActiveRecord::Base
	validates_presence_of :name, :degree, :blocks
	has_and_belongs_to_many :blocks
	has_many :users
end
