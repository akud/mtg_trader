require_relative '../../test_helper'
module CardPopulation
  class SeedWriterTest < ActiveSupport::TestCase
    class OutputStub
      attr_reader :seed
      def puts arg
        @seed = arg
      end
    end
    def test_write_card
      output = OutputStub.new
      seed_writer = SeedWriter.new output
      seed_writer.write_card :name => "Norin the Wary", :rarity => "Rare"
      assert_difference "Card.where(:name => 'Norin the Wary', :rarity => 'Rare').count" do
        eval output.seed
      end
    end
  end
end
