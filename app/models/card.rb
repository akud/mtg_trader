class Card < ActiveRecord::Base
  attr_accessible :name, :rarity

  COMMON = "Common"
  UNCOMMON = "Uncommon"
  RARE = "Rare"
  MYTHIC = "Mythic"
end
