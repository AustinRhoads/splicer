class User < ActiveRecord::Base
    has_many :monsters
    has_many :battle_users
    has_many :battles, through: :battle_users
    has_one :battle_party  
  
   




    def gain_experience(exp)
        self.experience_points = self.experience_points + exp
        self.enough_xp_for_level_up
    end

    def level_up
        self.level = self.level + 1
    end

    def enough_xp_for_level_up

        next_level_exp = EXP_LEVELS[self.level]

        my_exp = self.experience_points

        if my_exp >= next_level_exp
            self.level_up
        end
      
    end

    def set_top_three_as_battle_party
        if self.monsters.count >= 3 
                if self.battle_party != nil
                    self.battle_party.delete
                end
            battle_party = self.build_battle_party
            battle_party.monsters <<  self.monsters.sort_by {|monster| monster.hp}.reverse![0..2]
            battle_party.save
        end
    end

    EXP_LEVELS = [0, 300, 900, 2700, 6500, 14000, 23000, 34000, 48000, 64000, 85000, 100000, 120000, 140000, 165000, 195000, 225000, 265000, 305000, 355000]

end
