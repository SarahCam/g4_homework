require('pry')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    save = SqlRunner.run(sql, values)
    @id = save[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * FROM artists"
    artist_list = SqlRunner.run(sql)
    return artist_list.map { |artist| Artist.new(artist) }
  end

  def my_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album_list = SqlRunner.run(sql, values)
    return album_list.map { |album| Album.new(album) }
  end

  def edit()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete_me()
      sql = "DELETE FROM artists WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
  end

end
