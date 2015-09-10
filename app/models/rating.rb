class Rating < ActiveRecord::Base

  belongs_to :event
  belongs_to :user

def avg_rating
  average_rating = 0.0
  count = 0
  ratings.each do |rating| 
    if rating.attend != nil 
      if rating.attend != 0
      average_rating += rating.attend
      count += 1
      end
    end
  end
                
  if count != 0
    puts "check"
    (average_rating / count)
  else
    count
  end
end

end

