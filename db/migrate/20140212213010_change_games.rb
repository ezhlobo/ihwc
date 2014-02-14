class ChangeGames < ActiveRecord::Migration
   def change
      change_table :games do |t|
         t.has_and_belongs_to_many :teams
      end
   end
end
