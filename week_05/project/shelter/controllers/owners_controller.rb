require_relative('../models/owner')

get '/owners' do
  @owners = Owner.find_all()
  erb(:owners)
end
