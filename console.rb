require_relative('models/property_tracker')

property1 = PropertyTracker.new({'address' => '1 Main St.', 'value' => '100000', 'year_built' => '1950', 'buy_let' => 'buy'})

property1.save

property1.year_built = "2001"

property1.update
#property1.delete_all
property1.save

property1.find('15')
