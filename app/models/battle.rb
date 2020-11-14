class Battle < ApplicationRecord
    has_many :battle_users
    has_many :users, through: :battle_users
    has_many :battle_parties
    has_many :monsters, through: :battle_parties
end
