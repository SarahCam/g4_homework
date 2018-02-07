require('pry')
require_relative('models/artist')
require_relative('models/album')

### EMPTY ALL DATABASE TABLES ############################################

Album.delete_all()
Artist.delete_all()

### ADD NEW ARTIST & SAVE TO DB ##########################################

artist1 = Artist.new( {'name' => 'Lady Gaga'} )
artist2 = Artist.new( {'name' => 'Depeche Mode'} )

artist1.save()
artist2.save()

### ADD NEW ALBUM & SAVE TO DB ###########################################

album1 = Album.new( {
  'name' => 'Artpop',
  'genre' => 'Pop',
  'artist_id' => artist1.id
  } )

album2 = Album.new( {
  'name' => 'Speak and Spell',
  'genre' => 'Indie',
  'artist_id' => artist2.id
  } )

album3 = Album.new( {
  'name' => 'Black Celebration',
  'genre' => 'Indie',
  'artist_id' => artist2.id
  } )

album4 = Album.new( {
  'name' => 'Music for the Masses',
  'genre' => 'Indie',
  'artist_id' => artist2.id
  } )

album1.save()
album2.save()
album3.save()
album4.save()

### LIST ALL ARTISTS / ALBUMS ############################################

all_albums = Album.list_all()
all_artists = Artist.list_all()

### LIST ALL ALBUMS FOR AN ARTIST ######################################

artist2_albums = artist2.my_albums()

### DEBUGGING ############################################################

binding.pry
nil
