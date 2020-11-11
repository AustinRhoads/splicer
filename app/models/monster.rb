class Monster < ApplicationRecord
    belongs_to :user
    has_many :monster_genes
    has_many :genes, through: :monster_genes
    belongs_to :head
    belongs_to :arm
    belongs_to :leg
    belongs_to :back

    before_save :specs
    before_save :set_hp
   

    def full_hp

    end

    def current_hp
        #next on the todo list
    end

    def specs
        @specs ||=
      self.dexterity = self.head.dexterity + self.arm.dexterity + self.leg.dexterity + self.back.dexterity
      self.attack = self.head.attack + self.arm.attack + self.leg.attack + self.back.attack
      self.counter = self.head.counter + self.arm.counter + self.leg.counter + self.back.counter
      self.speed = self.head.speed + self.arm.speed + self.leg.speed + self.back.speed
      self.recoil = self.head.recoil + self.arm.recoil + self.leg.recoil + self.back.recoil
      {:dexterity => self.dexterity, :attack => self.attack, :defense => self.counter, :speed => self.speed, :recoil => self.recoil}
    end


    def set_hp
       self.hp = (self.user.level * 100) + ((self.dexterity + self.counter) * 10) + (self.attack) + (5 * rand(1..20)) 
       # binding.pry
    end

end
