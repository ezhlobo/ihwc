require 'sinatra'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/hi' do
  "Hello World!"
end

get "/" do
	erb :index
end

get "/mrbug" do
	erb :adminspage
end