class User < ActiveRecord::Base
    has_many :monsters
    has_many :battle_users
    has_many :battles, through: :battle_users
    has_many :battle_parties
  
   




    def gain_experience(exp)
        self.experience_points = self.experience_points + exp
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

    EXP_LEVELS = [0, 300, 900, 2700, 6500, 14000, 23000, 34000, 48000, 64000, 85000, 100000, 120000, 140000, 165000, 195000, 225000, 265000, 305000, 355000]

end
