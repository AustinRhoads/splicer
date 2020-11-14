class BattleParty < ApplicationRecord
  belongs_to :user
  has_many :monsters
  validates_length_of :monsters, is: 3, message: "You need exactly 3 monsters in a battle party."
end
