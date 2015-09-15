class ChangeTableRatings < ActiveRecord::Migration
  def change
    
    change_table :ratings do |t|
      unless column_exists? :ratings, :attend	
      	t.rename :stars, :attend
  	  end
  	  unless column_exists? :ratings, :tough	
      	t.integer :tough, :default => 0
      end
      unless column_exists? :ratings, :effort
	     t.integer :effort, :default => 0
 	  end
 	  unless column_exists? :ratings, :share	
 	  	t.integer :share, :default => 0
 	  end
 	  unless column_exists? :ratings, :material	
  	  	t.integer :material, :default => 0
  	  end
  	end
  end
end
