class Monster < ApplicationRecord

    attr_accessor :remote_image_url
    belongs_to :user
    belongs_to :head
    belongs_to :arm
    belongs_to :leg
    belongs_to :back
    belongs_to :fast_attack
    belongs_to :charged_attack
    has_one_attached :image
    mount_base64_uploader :image, ImageUploader

    validates :name, :uniqueness => { message: "The name %{value} is already taken. Try being original."}
    validates :name, :presence => { message: "Name you beast."}
    #validates :image, :presence => true

    before_save :specs
    before_save :set_hp
    before_save :set_to_full_hp
    before_validation :set_element
    before_validation :set_fast_attack
    before_validation :set_charged_attack
   

    def set_to_full_hp
        self.current_hp = self.hp
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
    

    def charged?
        if self.charger >= 15
            true
        else
            false
        end
    end

    def set_hp
        if self.hp == nil
            self.hp = (self.user.level * 100) + ((self.dexterity + self.counter) * 10) + (self.attack) + (5 * rand(1..20)) 
        end
    end

    def set_element
        parts = [self.head.element, self.arm.element, self.leg.element, self.back.element]
        self.element = parts.max_by{|part| parts.count(part)} 
    end

    def set_fast_attack
        self.fast_attack = FastAttack.all.select {|fa| fa.element == self.element}.sample
        
    end

    def set_charged_attack
        self.charged_attack = ChargedAttack.all.select {|ca| ca.element == self.element}.sample
        
    end
    

end









#notes

#    def use_fast_attack(opponent)
#        if rand(1..20) + self.attack >= 10 + opponent.counter 
#            opponent.current_hp -= self.fast_attack.damage_points
#            self.current_hp -= opponent.recoil
#        else
#            self.current_hp -= opponent.recoil
#        end
#        self.charger += 1
#    end
#
#    def use_charged_attack(opponent)
#        if (rand(1..20) + self.attack >= 10 + opponent.counter ) && self.charged? == true
#            opponent.current_hp -= self.charged_attack.damage_points
#            self.current_hp -= opponent.recoil
#        else
#            opponent.current_hp -= (self.charged_attack.damage_points * 0.5)
#            self.current_hp -= opponent.recoil
#        end
#        self.charger = 0
#    end