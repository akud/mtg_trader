output_file = File.open("#{Rails.root}/db/seeds.rb", 'w')
card_collection = CardPopulation::GathererCollection.new
card_writer = CardPopulation::SeedWriter.new(output_file)

CardPopulation::Generator.new(:collection => card_collection, :writer => card_writer).generate
