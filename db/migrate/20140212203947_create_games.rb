class CreateGames < ActiveRecord::Migration
   def up
      create_table :games do |t|
         t.string :date
         t.integer :place
         t.boolean :finished
      end
   end
end
