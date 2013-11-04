module CardPopulation
  class ExcludeCommonsFilter
    def include? card_hash
      card_hash[:rarity] != Card::COMMON
    end
  end
end
