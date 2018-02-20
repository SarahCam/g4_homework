require_relative('../models/owner')

get '/owners' do
  @owners = Owner.find_all()
  if !@owner_details
    @owner_details = @owners.first()
  end
  erb(:owners)
end

post '/owners' do
  @owners = Owner.find_all()
  @owner_details = Owner.find_by_id(params['id'].to_i)
  erb(:owners)
end
