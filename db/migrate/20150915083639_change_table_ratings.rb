class ChangeTableRatings < ActiveRecord::Migration
  def change
    
    change_table :ratings do |t|
      t.rename :stars, :attend
      t.integer :tough, :default => 0
      t.integer :effort, :default => 0
 	  t.integer :share, :default => 0
  	  t.integer :material, :default => 0
  end
end
