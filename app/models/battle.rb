class Battle < ApplicationRecord
    has_many :battle_users
    has_many :users, through: :battle_users
    has_many :battle_parties
    has_many :monsters, through: :battle_parties



    def player_one
        @player_one ||= self.users.where(:npc => false).first
     end

    def player_two
        @player_two ||= self.users.where(:npc => true).first
    end

    

end
