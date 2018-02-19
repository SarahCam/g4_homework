require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/registration_controller')
require_relative('controllers/animals_controller')

get '/' do
  erb(:home)
end
