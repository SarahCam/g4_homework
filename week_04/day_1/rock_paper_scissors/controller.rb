require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/game')

get '/' do
  erb(:about)
end

get '/rules' do
  erb(:rules)
end


get'/:hand1/:hand2' do
  hand1 = params[:hand1]
  hand2 = params[:hand2]
  game = Game.new(hand1, hand2)
  @winner = game.result()
  erb(:result)
end
