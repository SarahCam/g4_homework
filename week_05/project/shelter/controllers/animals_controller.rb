require_relative('../models/animal')

get '/animals' do
  @animals = Animal.find_all()
  erb(:animals)
end
