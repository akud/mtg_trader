module CardPopulation
  class Generator
    def initialize opts={}
      @collection = opts[:collection] || GathererCollection.new
      @writer = opts[:writer] || SeedWriter.new
      @filter = opts[:filter] || ExcludeCommonsFilter.new
    end

    def generate
      @collection.each_card do |card|
        @writer.write_card(card) if @filter.include?(card)
      end
    end
  end
end
