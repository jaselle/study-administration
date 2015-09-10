#ratings_controller to handle the Rating-system
#
#

class RatingsController < ApplicationController
  #creates the rating for the event, and response in Json-Format
  def create
  
    @rating = Rating.new(params[:rating])
    @event = Event.find(params[:rating][:event_id])

    respond_to do |format|
        if @rating.save
          format.json { render :json => { :avg_rating => @event.avg_rating } }
        else
          format.json { render :json => @rating.errors, :status => :unprocessable_entity }
        end
    end
  end

  #defines the update-Method for the shown stars
  def update
    @rating = Rating.find(params[:id])
    @event = Event.find(params[:rating][:event_id])

    @rating.attend =  params[:rating][:attend]
    respond_to do |format|
      if @rating.save
        format.json { render :json => { :avg_rating => @event.avg_rating } }
      else
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @rating = Rating.find(params[:id])
  end

  private
    def ratings_params
      params.require(:rating).permit(:attend, :user_id, :event_id)
    end
end

