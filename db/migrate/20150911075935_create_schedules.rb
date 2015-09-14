class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :date
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :schedules, :events
  end
end
