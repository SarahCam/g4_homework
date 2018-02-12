require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/game')


get'/:hand1/:hand2' do
  hand1 = params[:hand1]
  hand2 = params[:hand2]
  game = Game.new(hand1, hand2)
  @winner = game.result()
  erb(:result)
end

# get '/rock/scissors' do
#   @winner = "Rock"
#   erb(:result)
# end
#
# get '/scissors/rock' do
#   @winner = "Rock"
#   erb(:result)
# end
#
# get '/rock/paper' do
#   @winner = "Paper"
#   erb(:result)
# end
#
# get '/paper/rock' do
#   @winner = "Paper"
#   erb(:result)
# end
#
# get '/scissors/paper' do
#   @winner = "Scissors"
#   erb(:result)
# end
#
# get '/paper/scissors' do
#   @winner = "Scissors"
#   erb(:result)
# end
