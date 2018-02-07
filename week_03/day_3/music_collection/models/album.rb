require('pry')
require_relative('../db/sql_runner')

class Album

  attr_reader :id, :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @genre, @artist_id]
    save = SqlRunner.run(sql, values)
    @id = save[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * FROM albums"
    album_list = SqlRunner.run(sql)
    return album_list.map { |album| Album.new(album)}
  end

  def get_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)
    return Artist.new(artist[0])
  end

  def delete_me()
      sql = "DELETE FROM albums WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
  end

end
