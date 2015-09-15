class ChartsController < ApplicationController
  def index
    @course = Course.find(current_user.course_id)
   	@blocks = @course.blocks

  end

  def sumevent(block)
  	sumevent = 0
  		block.events.each do |event|
  			sumevent += event.users.count
  		end

  end

    # execute sql query
  def executesql(query)
      records_result = ActiveRecord::Base.connection.execute(query)
      result = records_result.getvalue(0, 0)
    return result
  end

  def block_users
  	sumblock = 0
  	@blocks.each do |block|
  		
  		sumblock += sumevent(block)
  	return sumblock
  	end

  end

end
