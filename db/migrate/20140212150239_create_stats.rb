class CreateStats < ActiveRecord::Migration
   def up
      create_table :stats do |t|
         t.belongs_to :team
         t.integer :gp
         t.integer :w
         t.integer :otw
         t.integer :otl
         t.integer :l
         t.integer :gf
         t.integer :ga
         t.integer :dif
         t.integer :pts
      end
   end

   def down
   end

end
