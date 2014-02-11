require 'sinatra'
require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
   :adapter => 'sqlite3',
   :database => 'db/sinatra.sqlite'
)

class Team < ActiveRecord::Base
   belongs_to :group
end

class Group < ActiveRecord::Base
end

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/' do
   @teams = Team.all
   @groups = Group.all
   erb :index
end

get '/teams' do
   @teams = Team.all
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





