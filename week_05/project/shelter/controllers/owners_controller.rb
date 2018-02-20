require_relative('../models/owner')

get '/owners' do
  @owners = Owner.find_all()
  erb(:owners)
end

post '/owners' do
  @owners = Owner.find_all()
  @owner_details = Owner.find_by_id(params['id'].to_i)
  erb(:owners)
end

post '/owners/edit' do
  owner = Owner.new(params)
  owner.update()
  redirect to("/owners")
end
