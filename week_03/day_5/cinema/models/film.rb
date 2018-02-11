require('pry')
require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_f
  end

  def count_customers()
    sql = "SELECT count(*) FROM tickets WHERE film_id = $1"
    values = [@id]
    count = SqlRunner.run(sql, values)[0]["count"].to_i
    return count
  end

 # CREATE
  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    save = SqlRunner.run(sql, values)
    @id = save[0]['id'].to_i
  end

  # UPDATE
  def update()
    sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
           INNER JOIN tickets ON customers.id = tickets.customer_id
           WHERE tickets.film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql,values)
    return customers.map { |customer| Customer.new(customer) }
  end

  def tickets()
    sql = "SELECT * FROM tickets WHERE film_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

  def popular_time()
    count = Hash.new(0)                                           # Create a new hash array to store counts
    tickets().each { |ticket| count[ticket.screening_id] += 1 }   # For each ticket, increment the total counts for it's screening and store in the screenings array
    screenings = count.sort_by { |key, value| value }             # Sort into order, from lowest to highest counts
    most_popular = screenings.last().first()                      # Get the first array item (the key - screening_id) from the last entry in the screenings array
    screening = Screening.find_by_id(most_popular)
    return screening.start_time
  end

  # DELETE
  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  # READ
  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film) }
  end

  def self.get_film(title)
    sql = "SELECT * FROM films WHERE title = $1"
    values = [title]
    film = SqlRunner.run(sql, values)[0]
    return Film.new(film)
  end

end
