class ChangeStats < ActiveRecord::Migration
   def change
      change_table :stats do |t|
         t.integer :rank
      end
   end
end
