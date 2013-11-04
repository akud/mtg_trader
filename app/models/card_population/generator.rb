module CardPopulation
  class Generator
    def initialize collection=GathererCollection.new, writer=SeedWriter.new
      @collection = collection
      @writer = writer
    end

    def generate
      @collection.each_card do |card|
        @writer.write_card card
      end
    end
  end
end
