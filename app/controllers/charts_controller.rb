class ChartsController < ApplicationController
  def index
  	@blocks = Block.all

  end

  def sumevent(block)
  	sumevent = 0
  		block.events.each do |event|
  			sumevent += event.users.count
  		end

  end

  def block_users
  	sumblock = 0
  	@blocks.each do |block|
  		
  		sumblock += sumevent(block)
  	return sumblock
  	end

  end

end
