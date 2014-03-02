require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/partial'

register Sinatra::Partial

configure do
  set :public_folder, Proc.new { File.join(root, "assets") }
  set :views, Proc.new { File.join(root, "templates") }
  set :partial_template_engine, :erb
  enable :sessions
end

get '/' do
  erb :index
end
