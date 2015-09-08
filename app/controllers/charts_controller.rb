class ChartsController < ApplicationController
  def index
  	@blocks = Block.all
  end
end
