require_relative('models/property_tracker')

property1 = PropertyTracker.new({'address' => '1 Main St.', 'value' => '100000', 'year_built' => '1950', 'buy_let' => 'buy'})
property2 = PropertyTracker.new({'address' => '2 Main St.', 'value' => '100000', 'year_built' => '1450', 'buy_let' => 'let'})

property1.save

property1.year_built = "2001"

property1.update
#property1.delete_all
property2.save

PropertyTracker.find('15')

#PropertyTracker.delete_all
