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
  @subtotal = subtotal(@order, @menu)
  @total = total(@order, @menu)
  erb :buy
end

post '/confirm' do
  @order = [params["Light"], params["Medium"], params["Bold"]]
  @menu = load_menu
  @total = total(@order, @menu)
  @subtotal = subtotal(@order, @menu)
  submit(@order, @menu, @total)
  erb :confirm
end

get '/orders' do

  erb :orders
end
