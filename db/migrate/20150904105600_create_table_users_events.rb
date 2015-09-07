class CreateTableUsersEvents < ActiveRecord::Migration

# in migration
def self.up
  create_table 'users_events', :id => false do |t|
    t.column :user_id, :integer
    t.column :event_id, :integer

  end
end

end

