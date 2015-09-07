class RenameUsersEvents < ActiveRecord::Migration
  def change
  	rename_table :users_events, :events_users
  end
end
