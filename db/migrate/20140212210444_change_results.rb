class ChangeResults < ActiveRecord::Migration
   def change
      change_table :results do |t|
         t.belongs_to :game
         t.integer :team_one
         t.integer :team_two
         t.integer :team_one_score
         t.integer :team_two_score
         t.integer :winner_id
      end
   end
end
