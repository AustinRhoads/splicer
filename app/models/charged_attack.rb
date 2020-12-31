class ChargedAttack < ApplicationRecord
    has_and_belongs_to_many :monsters
    has_many :monsters
    has_many :users, through: :monsters
end
