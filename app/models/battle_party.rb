class BattleParty < ApplicationRecord
  belongs_to :user
  has_many :monsters
end
