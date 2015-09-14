class EventsUsersAddDefaultToSemester < ActiveRecord::Migration
  def change
  	change_column :events_users, :semester, :string, :default => "Undefiniert"


  end
end
