class Event < ActiveRecord::Base


	has_many :ratings
  has_and_belongs_to_many :blocks

  has_many  :events_users
  has_many :users, through: :events_users

	validates_inclusion_of :cycle, :in => ['Jedes Wintersemester', 'Jedes Sommersemester', 'Jedes Semester', 'Jedes zweite Wintersemester', 'Jedes zweite Sommersemester', 'Nicht regelmäßig']
	validates_inclusion_of :credits, :in => 0..20
	validates_inclusion_of :sws, :in => 0..20
	validates_presence_of :prof, :title, :identifier




#method to calculate the average-rating. 
def avg_rating
  average_rating = 0.0
  count = 0
  ratings.each do |rating| 
    if rating.stars != nil 
      if rating.stars != 0
      average_rating += rating.stars
      count += 1
      end
    end
  end
                
  if count != 0
    puts "check"
    (average_rating / count)
  else
    count
  end
end


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
