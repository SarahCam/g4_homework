require('../db/sql_runner')
require('pry')

class Type

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

end
