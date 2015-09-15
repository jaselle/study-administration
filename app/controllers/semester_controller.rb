class SemesterController < ApplicationController
  def index
  	records_result = ActiveRecord::Base.connection.execute("SELECT title, semester, events.id FROM events, events_users WHERE events.id = events_users.event_id AND user_id = " + current_user.id.to_s)
  	temp = records_result.values

  	@userevents = []
  	temp.each do |row|
  		array = []
  		array << row[0]
  		array << row[1].split(' ')[0]
  		array << row[1].split(' ')[1]
      array << row[2]
  		@userevents << array
  	end

  	@userevents.sort_by! {|t| [t[2], t[1], t[0]]}
  end
end
