require('pry')
require_relative('models/artist')
require_relative('models/album')

### EMPTY ALL DATABASE TABLES ############################################

Artist.delete_all()
Album.delete_all()

### ADD NEW ARTIST & SAVE TO DB ##########################################

artist1 = Artist.new( {'name' => 'Lady Gaga'} )
artist1.save()

### ADD NEW ALBUM & SAVE TO DB ###########################################

album1 = Album.new( {
  'name' => 'Artpop',
  'genre' => 'pop'
  } )

album1.save()

binding.pry
nil
