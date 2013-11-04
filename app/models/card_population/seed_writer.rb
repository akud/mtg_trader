module CardPopulation
  class SeedWriter
    def initialize output=STDOUT
      @output = output
    end

    def write_card card_hash
      @output.puts <<-RUBY
        Card.create(:name => '#{card_hash[:name]}', :rarity => '#{card_hash[:rarity]}')
      RUBY
    end
  end
end
