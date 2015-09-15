class Block < ActiveRecord::Base
 validates_presence_of :name
 validates :credits_min, :numericality => { :greater_than_or_equal_to => 0 }
 has_and_belongs_to_many :events
 has_and_belongs_to_many :courses

	# The method import imports the CSV-Data, parses the headers
	# and creates an block per row.
	def self.import(file)
	  infile = File.read(file)
	  csv = CSV.parse(infile, :headers => true)
	  if csv.headers == ["name","gesamtects","credits_min","relation"] #header check
	    csv.each do |row|
	      row_hash = row.to_hash
	      block = Block.create! row_hash.except!("relation")
	      puts row_hash["relation"].nil?
	     # course = row_hash["relation"].split(";")
	      #course = Course.find_by(degree: course[0], name: course[1])
	      #unless course.nil? && !course.blocks.find_by_name(row_hash["name"]).nil?
	      #  course.blocks << block
	     #end
	    end
	    return true
	  else
	    return false
	  end
	end

end
