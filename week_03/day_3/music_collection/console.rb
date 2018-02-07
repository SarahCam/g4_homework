require('pry')
require_relative('models/artist')
require_relative('models/album')

artist1 = Artist.new( {'name' => 'Lady Gaga'} )
artist1.save()

album1 = Album.new( {
  'name' => 'Artpop',
  'genre' => 'pop'
  } )

binding.pry
nil
