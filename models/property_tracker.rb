require('pg')

class PropertyTracker

  attr_accessor :address, :value, :year_built, :buy_let
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value'].to_i
    @year_built = options['year_built'].to_i
    @buy_let = options['buy_let']
  end



  def save()
    db = PG.connect({dbname: 'property_database', host: 'localhost'})
    sql = "INSERT INTO property_tracker
    (address,
      value,
      year_built,
      buy_let)
      VALUES
      ($1, $2, $3, $4) RETURNING *;"

      values = [@address, @value, @year_built, @buy_let]
      db.prepare("save", sql)
      array_of_hashes = db.exec_prepared("save", values)
      @id = array_of_hashes[0]['id'].to_i
      db.close()
    end

    def update()
      db = PG.connect({dbname: 'property_database', host: 'localhost'})
      sql = "UPDATE property_tracker
      SET
      (address,
        value,
        year_built,
        buy_let) = ($1, $2, $3, $4) WHERE id = $5"
        values = [@address, @value, @year_built, @buy_let, @id]
        db.prepare("update", sql)
        db.exec_prepared("update", values)
        db.close()
      end

      def PropertyTracker.delete_all()
        db = PG.connect({dbname: 'property_database', host: 'localhost'})
        sql = "DELETE FROM property_tracker;"
        db.prepare("delete_all", sql)
        db.exec_prepared("delete_all")
        db.close()
      end

      def PropertyTracker.find(id_number)
        db = PG.connect({dbname: 'property_database', host: 'localhost'})
        sql = "SELECT * FROM property_tracker WHERE id = #{id_number};"
        db.prepare("find", sql)
        house_array = db.exec_prepared("find")
        db.close()
        puts house_array[0]['address']
      end


    end
