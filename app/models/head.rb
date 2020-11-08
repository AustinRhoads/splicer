class Head < ApplicationRecord
    has_and_belongs_to_many :monsters
end
