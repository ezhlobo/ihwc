class CreateTeams < ActiveRecord::Migration
  def change
	create_table :teams do |t|
		t.string :name
		t.belongs_to :group
	end

	create_table :games do |t|
		t.datetime :date
		t.string :place
		t.boolean :finished 
	end

	create_table :games_teams do |t|
		t.belongs_to :game
		t.belongs_to :team
	end

	create_table :groups do |t|
		t.string :name
	end

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
		t.integer :ranke
	end

	create_table :results do |t|
		t.belongs_to :game
		t.integer :team_one
		t.integer :team_two
		t.integer :team_one_score
		t.integer :team_two_score
		t.integer :winner_id
	end

  end
end
