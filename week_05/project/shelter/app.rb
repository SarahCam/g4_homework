require('sinatra')
require('sinatra/contrib/all')
# require_relative('controllers/admissions_controller')

get '/' do
  erb(:home)
end
