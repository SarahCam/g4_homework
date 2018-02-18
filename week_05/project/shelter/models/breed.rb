require('pry')
require_relative('../db/sql_runner')

class Breed

  attr_reader :id
  attr_accessor :name, :species_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species_id = options['species_id']
  end

end
