class CreateStatmatches < ActiveRecord::Migration
   def up
      create_table :statmatches do |t|
         t.belongs_to :team
         t.belongs_to :game
         t.integer :gf
         t.integer :ga
         t.integer :dif
         t.boolean :outtime
      end
   end
end
