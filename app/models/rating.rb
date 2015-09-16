class Rating < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

  def avg_rating(column)
    average_rating = 0.0
    count = 0
    @event.ratings.each do |rating|
      if rating.column != nil
        if rating.column != 0
        average_rating += rating.column
        count += 1
        end
      end
    end

    if count != 0
      (average_rating / count)
    else
      count
    end
  end

end
