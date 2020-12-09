class Arm < ApplicationRecord
    has_and_belongs_to_many :monsters
    has_one_attached :image
end
