require_relative('../models/animal')

get '/animals' do
  @animals = Animal.find_all()
  erb(:animals)
end

post '/animals' do
  @animals = Animal.find_all()
  @animal_details = Animal.find_by_id(params['id'].to_i)
  erb(:animals)
end

post '/animals/edit' do
  animal = Animal.new(params)
  animal.update()
  redirect to("/animals")
end

post '/animals/show' do
  redirect to("/animals")
end

get '/animals/:id' do
  @animals = Animal.find_all()
  @animal_details = Animal.find_by_id(params['id'].to_i)
  erb(:animals)
end
