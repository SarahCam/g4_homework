require('pry')
require_relative('../db/sql_runner')
require_relative('customer')
require_relative('film')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @screening_id = options['screening_id'].to_i
  end

  def get_customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values)
    return Customer.new(customer[0])
  end

  def get_film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values)
    return Film.new(film[0])
  end

  def get_screening()
    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [@screening_id]
    screening = SqlRunner.run(sql, values)
    return Screening.new(screening[0])
  end

  def charge_customer()
    price = get_film().price
    customer = get_customer
    customer.decrease_funds(price)
  end

  def book_seat()
    screening = get_screening
    screening.reserve_seat()
  end

 # CREATE
  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, screening_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@customer_id, @film_id, @screening_id]
    save = SqlRunner.run(sql, values)
    @id = save[0]['id'].to_i
  end

  # UPDATE
  def update()
    sql = "UPDATE tickets SET customer_id = $1, film_id = $2, screening_id = $3 WHERE id = $4"
    values = [@customer_id, @film_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  # READ
  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

end
