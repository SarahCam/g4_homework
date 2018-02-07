require('pry')

class Album

  attr_reader :id, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end
end
