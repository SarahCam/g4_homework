require('pry')
require_relative('models/artist')
require_relative('models/album')

### EMPTY ALL DATABASE TABLES ############################################

Artist.delete_all()

### ADD NEW ARTIST #######################################################

artist1 = Artist.new( {'name' => 'Lady Gaga'} )
artist1.save()

### ADD NEW ALBUM ########################################################

album1 = Album.new( {
  'name' => 'Artpop',
  'genre' => 'pop'
  } )

binding.pry
nil
