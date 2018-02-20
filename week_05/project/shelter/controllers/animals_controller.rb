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

# get '/animals/edit' do
#   @animals = Animal.find_all()
#   if !@animal_details
#     @animal_details = @animals.first()
#   end
#   erb(:animals)
# end

post '/animals/edit' do
  animal = Animal.new(params)
  animal.update()
  redirect to("/animals")
end
