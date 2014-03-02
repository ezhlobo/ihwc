require 'rubygems'
require 'sinatra'
require 'sinatra/partial'
require 'sinatra/activerecord'

require './config/environments'
require './models/game'
require './models/team'
require './models/group'
require './models/stat'
require './models/result'

register Sinatra::Partial

configure do
  set :public_folder, Proc.new { File.join(root, "assets") }
  set :views, Proc.new { File.join(root, "templates") }
  set :partial_template_engine, :erb
end

get '/' do
  @teams = Team.all
  @groups = Group.all
  @stats = Stat.all
  @games = Game.all
  @results = Result.all
  erb :index
end

after do
  ActiveRecord::Base.connection.close
end
