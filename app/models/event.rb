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
  if csv.headers == ["identifier" , "title","description","prof","credits","sws","cycle","exam_type","condition", "relation"] #header check
    csv.each do |row|
      row_hash = row.to_hash
      if Event.find_by_identifier(row_hash["identifier"]).nil?
        event = Event.create! row_hash.delete("relation")
      end
      relations = row_hash["relation"].split(";")
      relations.each do |rel|
        block = Block.find_by_name(rel)
        unless block.nil? && !block.events.find_by_identifier(row_hash["identifier"]).nil?
          block.events << event
        end
      end
    end
    return true
  else
    return false
  end
end

# made event searchable, edit here for columns which should be searchable
  def self.search(search)
    if search
      where("lower(prof) LIKE lower(?) OR lower(identifier) LIKE lower(?) OR lower(title) LIKE lower(?) OR lower(description) LIKE lower(?) OR lower(cycle) LIKE lower(?) OR lower(exam_type) LIKE lower(?) OR lower(condition) LIKE lower(?)", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%", "%#{search}%")
    else
      where(nil)
    end
  end

end
