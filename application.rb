require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/partial'

register Sinatra::Partial

class Games < ActiveRecord::Base
end

configure do
  db = URI.parse('postgres://userdb:pass@localhost/ihwc_development')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )

  set :public_folder, Proc.new { File.join(root, "assets") }
  set :views, Proc.new { File.join(root, "templates") }
  set :partial_template_engine, :erb
end

get '/' do
  @games = Games.all
  erb :index
end
