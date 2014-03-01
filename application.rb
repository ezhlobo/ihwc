require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/partial'
require 'sqlite3'

register Sinatra::Partial

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/sinatra.sqlite'
)

class Team < ActiveRecord::Base
  belongs_to :group
  has_one :stat
  has_and_belongs_to_many :games
end

class Group < ActiveRecord::Base
  has_many :teams
end

class Stat < ActiveRecord::Base
  belongs_to :team
end

class Game < ActiveRecord::Base
  has_and_belongs_to_many :teams
  has_one :result
end

class Result < ActiveRecord::Base
  belongs_to :game
end

configure do
  set :public_folder, Proc.new { File.join(root, "assets") }
  set :views, Proc.new { File.join(root, "templates") }
  set :partial_template_engine, :erb
  enable :sessions
end

get '/' do
  @teams = Team.all
  @groups = Group.all
  @stats = Stat.all
  @games = Game.all
  @results = Result.all
  erb :index
end

get '/teams' do
  @teams = Team.all
  @groups = Group.all
  @stats = Stat.all
  @games = Game.all
  @results = Result.all
  erb :teams
end

post '/teams' do
  @team = Team.new(params)
  @team.save
  redirect to('/teams')
end

delete '/teams' do
  @team = Team.find_by(:name => params[:name])
  @team.destroy
  redirect to('/teams')
end





