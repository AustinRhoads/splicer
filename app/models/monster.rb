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
    validates :name, :presence => { message: "Name ya beast."}
    validates :head, :presence => { message: "Where's ya head?"}
    validates :arm, :presence => { message: "Give your monster a hand... or two."}
    validates :leg, :presence => { message: "Your creature doesn't have a leg to stand on."}
    validates :back, :presence => { message: "Your missing a bit aren't ya?"}
    #validates :image, :presence => true

    before_save :set_specs_and_hp

    before_validation :set_element_and_attacks
   

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

    def has_all_parts
        (self.head && self.arm && self.leg && self.back) ? true:false
    end

    def set_specs_and_hp
        if self.has_all_parts
            self.specs
            self.set_hp
            self.set_to_full_hp
        end
    end

    def set_element_and_attacks
        if self.has_all_parts
            self.set_element
            self.set_fast_attack
            self.set_charged_attack
        end
    end
    

end




