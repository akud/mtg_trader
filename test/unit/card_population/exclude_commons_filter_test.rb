require_relative '../../test_helper'
module CardPopulation
  class ExcludeCommonsFilterTest < ActiveSupport::TestCase
    def test_include
      filter = ExcludeCommonsFilter.new
      assert !filter.include?(:rarity => Card::COMMON), "should exclude commons"
      assert filter.include?(:rarity => Card::UNCOMMON), "should not exclude uncommons"
    end
  end
end
