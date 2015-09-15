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
	      relation = row_hash["relation"]
	      unless Block.find_by(name: row_hash["name"], gesamtects: row_hash["gesamtects"], credits_min: row_hash["credits_min"])
	      	block = Block.create! row_hash.except!("relation")
	      	unless relation.nil?
		      course = relation.split(";")
		      course = Course.find_by(degree: course[0], name: course[1])
		      if (!course.nil? && course.blocks.find_by_name(row_hash["name"]).nil?)
		        course.blocks << block
		      end
		   	end
		   end
	    end
	    return true
	  else
	    return false
	  end
	end

end
