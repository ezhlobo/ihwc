class CreateTeams < ActiveRecord::Migration
  def up
      create_table :teams do |t|
         t.string :name
      end
  end

  def down
  end
end
