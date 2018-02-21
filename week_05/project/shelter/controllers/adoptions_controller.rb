require_relative('../models/adoption')
require_relative('../models/owner')
require_relative('../models/animal')


get '/adoptions' do
  @adoptions = Adoption.find_all()
  @animals = Animal.find_all()
  @owners = Owner.find_all()
  erb(:adoptions)
end

post '/adoptions' do
  animal = Animal.find_by_id(params['animal_id'].to_i)
  owner = Owner.find_by_id(params['owner_id'].to_i)
  animal.adopted_by(owner)
  redirect to("/adoptions")
end
