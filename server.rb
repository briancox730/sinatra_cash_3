require 'sinatra'
require_relative 'helpers'
require 'pry'

get '/' do
  @menu = load_menu
  @title = "Home"

  erb :index
end

post '/purchase' do
  @order = [params["Light"], params["Medium"], params["Bold"]]
  @menu = load_menu
  erb :buy
end

post '/confirm' do
  @order = [params["Light"], params["Medium"], params["Bold"]]
  @menu = load_menu
  submit(params["Light"], params["Medium"], params["Bold"])
  erb :confirm
end
