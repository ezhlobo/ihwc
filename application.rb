require 'sinatra'

get '/hi' do
  "Hello World!"
end

get "/" do
	erb :index
end

get "/mrbug" do
	erb :adminspage
end