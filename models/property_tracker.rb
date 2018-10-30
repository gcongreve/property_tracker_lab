require('pg')

class PropertyTracker

  attr_accessor :address, :value, :year_built, :buy_let

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value'].to_i
    @year_built = options['year_built'].to_i
    @buy_let = options['buy_let']
  end

end
