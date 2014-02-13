class ChangeTeams < ActiveRecord::Migration
  def change
      change_table :teams do |t|
         t.belongs_to :group
      end
   end
end
