class Gene < ApplicationRecord
    has_many :monsters_genes
    has_many :monsters, through: :monsters_genes
end
