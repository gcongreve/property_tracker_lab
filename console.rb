require_relative('models/property_tracker')

property1 = PropertyTracker.new({'address' => '1 Main St.', 'value' => '100000', 'year_built' => '1950', 'buy_let' => 'buy'})
property2 = PropertyTracker.new({'address' => '2 Main St.', 'value' => '100000', 'year_built' => '1450', 'buy_let' => 'let'})
property3 = PropertyTracker.new({'address' => '7 Main St.', 'value' => '100000', 'year_built' => '1450', 'buy_let' => 'let'})

property1.save

property1.year_built = "2001"

property1.update
#property1.delete_all
property2.save
property3.save
found_by_id_house = PropertyTracker.find('54')
p found_by_id_house

#PropertyTracker.delete_all

found_by_address_house =  PropertyTracker.find_by_address("'7 Main St.'")
p found_by_address_house

test_address_house =  PropertyTracker.find_by_address("'7 Fake St.'")
p test_address_house
