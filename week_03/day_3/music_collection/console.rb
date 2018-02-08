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

### LIST ALL ALBUMS FOR AN ARTIST ########################################

artist1_albums = artist1.my_albums()
artist2_albums = artist2.my_albums()

### SHOW ARTIST THAT CREATED THIS ALBUM ##################################

album1_artist = album1.get_artist()
album2_artist = album2.get_artist()

### EDIT ARTIST ##########################################################

artist1.name = "GAGA"
artist1.edit()

### EDIT ALBUM ###########################################################

album1.name = "ART POP"
album1.edit()

### Find Artists/Albums by their ID ######################################

my_artist1 = artist1.find()

### DELETE ALBUM #########################################################

delete_album1_DELETED = album1.delete_me()

### DELETE ARTIST WITH NO ALBUMS #########################################

delete_artist1_DELETED = artist1.delete_me()

### ATTEMPT TO DELETE ARTIST WITH ALBUMS #################################

delete_artist2_DELETE_CASCADE = artist2.delete_me()

### DEBUGGING ############################################################

binding.pry
nil
