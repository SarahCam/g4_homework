require('pry')
require_relative('models/artist')
require_relative('models/album')

artist1 = Artist.new( {'name' => 'Lady Gaga'} )

binding.pry
nil
