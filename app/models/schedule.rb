class Schedule < ActiveRecord::Base
  belongs_to :event
  validates_uniqueness_of :event_id, :scope => [:date]
  validates :date, presence: true, allow_blank: false
  validate :validation_method

  #schedulaes are only for events with irregular cycle
  def validation_method
  unless :cycle != "Nicht regelmäßig"
  		errors.add(:cycle, "invalid")
  	end	
  end

end
