require_relative('../models/adoption')
require_relative('../models/owner')
require_relative('../models/animal')


get '/adoptions' do
  @adoptions = Adoption.find_all()
  erb(:adoptions)
end
