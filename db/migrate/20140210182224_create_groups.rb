class CreateGroups < ActiveRecord::Migration
  def up
      create_table :groups do |t|
         t.string :name
      end
  end

  def change
      create_table :teams do |t|
         t.belong_to :group
      end
  end

  def down
  end
end
