class Course < ActiveRecord::Base
	validates_presence_of :name, :degree, :blocks
	has_and_belongs_to_many :blocks
	has_many :users

	# The method import imports the CSV-Data, parses the headers
	# and creates an course per row.
	def self.import(file)
	  infile = File.read(file)
	  csv = CSV.parse(infile, :headers => true)
	  if csv.headers == ["degree","name"] #header check
	    csv.each do |row|
	      row_hash = row.to_hash
	      if Course.find_by(name: row_hash["name"], degree: row_hash["degree"]).nil?
	      	Block.create! row_hash
	      end
	    end
	    return true
	  else
	    return false
	  end
	end

end
