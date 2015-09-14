class CreateNexts < ActiveRecord::Migration
  def change
    create_table :nexts do |t|
      t.string :date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :nexts, :users
  end
end
