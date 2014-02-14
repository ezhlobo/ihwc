class ChangeTeams < ActiveRecord::Migration
  def change
      change_table :teams do |t|
         t.has_and_belongs_to_many :games
      end
   end
end
