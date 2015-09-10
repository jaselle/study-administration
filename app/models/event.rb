class Event < ActiveRecord::Base

	has_many :ratings
  has_and_belongs_to_many :blocks

  has_many  :events_users
  has_many :users, through: :events_users
  accepts_nested_attributes_for :events_users

	validates_inclusion_of :cycle, :in => ['Jedes Wintersemester','Jedes Sommersemester','Jedes Semester', 'Jedes Wintersemester (ungerade)', 'Jedes Wintersemester (gerade)', 'Jedes Sommersemester (ungerade)', 'Jedes Sommersemester (gerade)', 'Nicht regelmäßig' ]
	validates_inclusion_of :credits, :in => 0..20
	validates_inclusion_of :sws, :in => 0..20
	validates_presence_of :prof, :title, :identifier







# The method import imports the CSV-Data, parses the headers
# and creates an event per row.
def self.import(file)
  infile = File.read(file)
  csv = CSV.parse(infile, :headers => true)
  if csv.headers == ["identifier" , "title","description","prof","credits","sws","cycle","exam_type","condition"] #header check
    csv.each do |row|
      Event.create! row.to_hash
    end
    return true
  else
    return false
  end

end

end
