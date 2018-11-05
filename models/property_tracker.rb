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
    ($1, $2, $3, $4) RETURNING *;" #should only return id
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
        sql = "SELECT * FROM property_tracker WHERE id = $1;"
        values = [id_number]
        db.prepare("find", sql)
        house_array = db.exec_prepared("find", values)
        db.close()
        return house_array[0]
      end

      # def PropertyTracker.find_by_address(address)
      #   db = PG.connect({dbname: 'property_database', host: 'localhost'})
      #   sql = "SELECT * FROM property_tracker WHERE address = $1;"
      #   vaules = (address)
      #   db.prepare("find_address", sql)
      #   house_array = db.exec_prepared("find_address", address)
      #   db.close()
      #   return nil if house_array.length == 0
      #   house_hash = house_array[0]
      #   found_house = PropertyTracker.new(house_hash)
      #   return found_house
      # end

      def PropertyTracker.find_by_address(address)
        db = PG.connect({dbname: 'property_database', host: 'localhost'})
        sql = "SELECT * from property_tracker WHERE address = $1"
        values = [address]
        db.prepare("address", sql)
        results_array = db.exec_prepared("address", values)
        db.close()
        return nil unless results_array.count > 0
        property_hash = results_array[0]
        found_property = Property.new(property_hash)
        return found_property

      end

    end
