class Schedule < ActiveRecord::Base
  belongs_to :event
  validates_uniqueness_of :event_id, :scope => [:date]
  validate :validation_method

  #schedulaes are only for events with irregular cycle
  def validation_method
   	unless Event.find_by_id_and_cycle(self.event_id, "Nicht regelmäßig")
  		errors.add(:cycle, "invalid")
  	end	
  end

end
