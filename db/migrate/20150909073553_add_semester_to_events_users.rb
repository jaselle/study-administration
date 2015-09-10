class AddSemesterToEventsUsers < ActiveRecord::Migration
  def change
    add_column :events_users, :semester, :string
  end
end
