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
    sql = "INSERT INTO albums (name, genre) VALUES ($1, $2) RETURNING id"
    values = [@name, @genre]
    save = SqlRunner.run(sql, values)
    @id = save[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end
