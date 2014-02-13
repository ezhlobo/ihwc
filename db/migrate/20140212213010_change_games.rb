class ChangeGames < ActiveRecord::Migration
   def change
      change_table :games do |t|
         t.integer :team_id_one
         t.integer :team_id_two
      end
   end
end
