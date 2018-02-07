require('pry')
require_relative('models/artist')
require_relative('models/album')

artist1 = Artist.new( {'name' => 'Lady Gaga'} )
album1 = Album.new( {
  'name' => 'Artpop',
  'genre' => 'pop'
  } )

binding.pry
nil
