# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
##
## Examples:
##
##   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
##   Character.create(name: 'Luke', movie: movies.first)
#
    aush = User.create(:name => "Austinz", :npc => true, :level => 1)
    klause = User.create(:name => "Klause Vadenstratta", :npc => true, :level => 1)
    mari = User.create(:name => "Marilyn", :npc => true, :level => 2)
    varuuka = User.create(:name => "V. Saltz", :npc => true, :level => 2)
    sid = User.create(:name => "Sidney", :npc => true, :level => 3)
    candyman = User.create(:name => "Zee CandyManCan", :npc => true, :level => 3)
    dr = User.create(:name => "Dr. funkenstien", :npc => true, :level => 4)
    bootsy = User.create(:name => "Bootsy Collins", :npc => true, :level => 5)
#
    HEADS = [
        {:name => "Dactys Head", :element => "air", :dexterity => 2, :attack => 1, :counter => 0, :recoil => 1, :speed => 2},
        {:name => "Taurac Head", :element => "earth", :dexterity => 1, :attack => 2, :counter => 2, :recoil => 0, :speed => 1},
        {:name => "Trogbyte Head", :element => "water", :dexterity => 0, :attack => 2, :counter => 1, :recoil => 2, :speed => 0},
        {:name => "Pheonix Head", :element => "fire", :dexterity => 1, :attack => 2, :counter => 1, :recoil => 1, :speed => 1}
    ]

    HEADS.each {|head| Head.create(head)}

    da_head = Head.find_by(:name => "Dactys Head")
    da_head.image.attach(
        io: File.open("app/assets/images/dactys_head.png"),
        filename: "nw.png"
    )
    da_head.save

    ta_head = Head.find_by(:name => "Taurac Head")
    ta_head.image.attach(
        io: File.open("app/assets/images/tauracs_head.png"),
        filename: "nw.png"
    )
    ta_head.save

    tr_head = Head.find_by(:name => "Trogbyte Head")
    tr_head.image.attach(
        io: File.open("app/assets/images/Trog_head.png"),
        filename: "nw.png"
    )
    tr_head.save

    ph_head = Head.find_by(:name => "Pheonix Head")
    ph_head.image.attach(
        io: File.open("app/assets/images/pheonix_head.png"),
        filename: "nw.png"
    )
    ph_head.save

  


    ARMS = [
        {:name => "Dactys Claws", :element => "air", :dexterity => 2, :attack => 0, :counter => 0, :recoil => 0, :speed => 2},
        {:name => "Taurac Stompers", :element => "earth", :dexterity => 1, :attack => 3, :counter => 2, :recoil => 0, :speed => 1},
        {:name => "Trogbyte Hooks", :element => "water", :dexterity => 0, :attack => 2, :counter => 1, :recoil => 0, :speed => 0},
        {:name => "Pheonix Claws", :element => "fire", :dexterity => 1, :attack => 2, :counter => 1, :recoil => 1, :speed => 1}
    ]

    ARMS.each {|arm| Arm.create(arm)}

    da_arms = Arm.find_by(:name => "Dactys Claws")
    da_arms.image.attach(
        io: File.open("app/assets/images/dactys_arms.png"),
        filename: "nw.png"
    )
    da_arms.save

    ta_arms = Arm.find_by(:name => "Taurac Stompers")
    ta_arms.image.attach(
        io: File.open("app/assets/images/taurac_arms.png"),
        filename: "nw.png"
    )
    ta_arms.save

    tr_arms = Arm.find_by(:name => "Trogbyte Hooks")
    tr_arms.image.attach(
        io: File.open("app/assets/images/trog_arms.png"),
        filename: "nw.png"
    )
    tr_arms.save

    ph_arms = Arm.find_by(:name => "Pheonix Claws")
    ph_arms.image.attach(
        io: File.open("app/assets/images/pheonix_arms.png"),
        filename: "nw.png"
    )
    ph_arms.save

    
    #, :image => "taurac_arms.png"
#, :image => "trog_arms.png"
    LEGS = [
        {:name => "Dactys Talons", :element => "air", :dexterity => 2, :attack => 2, :counter => 1, :recoil => 0, :speed => 2},
        {:name => "Taurac Stompers", :element => "earth", :dexterity => 1, :attack => 3, :counter => 1, :recoil => 0, :speed => 1},
        {:name => "Trogbyte Crawlers", :element => "water", :dexterity => 2, :attack => 1, :counter => 1, :recoil => 1, :speed => 2},
        {:name => "Pheonix Clutches", :element => "fire", :dexterity => 2, :attack => 2, :counter => 0, :recoil => 1, :speed => 1}
    ]

    LEGS.each  {|leg| Leg.create(leg)}

    da_legs = Leg.find_by(:name => "Dactys Talons")
    da_legs.image.attach(
        io: File.open("app/assets/images/dactys_legs.png"),
        filename: "nw.png"
    )
    da_legs.save

    ta_legs = Leg.find_by(:name => "Taurac Stompers")
    ta_legs.image.attach(
        io: File.open("app/assets/images/tauracs_legs.png"),
        filename: "nw.png"
    )
    ta_legs.save

    tr_legs = Leg.find_by(:name => "Trogbyte Crawlers")
    tr_legs.image.attach(
        io: File.open("app/assets/images/trog_legs.png"),
        filename: "nw.png"
    )
    tr_legs.save

    ph_legs = Leg.find_by(:name => "Pheonix Clutches")
    ph_legs.image.attach(
        io: File.open("app/assets/images/pheonix_legs.png"),
        filename: "nw.png"
    )
    ph_legs.save


#, :image => "tauracs_legs.png"
    #, :image => "trog_legs.png"

    BACKS = [
        {:name => "Dactys wings", :element => "air", :dexterity => 2, :attack => 1, :counter => 0, :recoil => 0, :speed => 1},
        {:name => "shell", :element => "earth", :dexterity => 1, :attack => 1, :counter => 2, :recoil => 0, :speed => 0},
        {:name => "spikes", :element => "water", :dexterity => 0, :attack => 1, :counter => 1, :recoil => 1, :speed => 1},
        {:name => "Pheonix wings", :element => "fire", :dexterity => 2, :attack => 2, :counter => 0, :recoil => 1, :speed => 2}
    ]

    BACKS.each {|back| Back.create(back)}

    da_back = Back.find_by(:name =>  "Dactys wings")
    da_back.image.attach(
        io: File.open("app/assets/images/dactys_back.png"),
        filename: "nw.png"
    )
    da_back.save

    ta_back = Back.find_by(:name => "shell")
    ta_back.image.attach(
        io: File.open("app/assets/images/tauracs_back.png"),
        filename: "nw.png"
    )
    ta_back.save

    tr_back = Back.find_by(:name => "spikes")
    tr_back.image.attach(
        io: File.open("app/assets/images/trog_back.png"),
        filename: "nw.png"
    )
    tr_back.save

    ph_back = Back.find_by(:name => "Pheonix wings")
    ph_back.image.attach(
        io: File.open("app/assets/images/pheonix_wings.png"),
        filename: "nw.png"
    )
    ph_back.save
#, :image => "tauracs_back.png"
#, :image => "trog_back.png"



FAST_ATTACKS = [
{:name => "Acid Rain", :damage_points => 5, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Water Jet", :damage_points => 6, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Bubble Pop", :damage_points => 12, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Dissolution", :damage_points => 7, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Fire Ball", :damage_points => 5, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Plasma Cut", :damage_points => 8, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Volcanic Rift", :damage_points => 14, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Flamthrower", :damage_points => 10, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Tackle", :damage_points => 5, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Stomp", :damage_points => 11, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Take The Grasshoper From My Hand", :damage_points => 12, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Dirt Slap", :damage_points => 6, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Air Cut", :damage_points => 5, :element => "air", :weakness_element => "earth", :strength_element => "water" },
{:name => "Sky Dive", :damage_points => 7, :element => "air", :weakness_element => "earth", :strength_element => "water" },
{:name => "Feather Fist", :damage_points => 14, :element => "air", :weakness_element => "earth", :strength_element => "water" },
{:name => "Wind Tunnel", :damage_points => 7, :element => "air", :weakness_element => "earth", :strength_element => "water" }
]

FAST_ATTACKS.each {|fast_a| FastAttack.create(fast_a).save} 

CHARGED_ATTACKS = [
{:name => "Tsunami Wall", :damage_points =>  99, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Vaporize", :damage_points =>  112, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Aqua Slap", :damage_points =>  110, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Splash Back", :damage_points =>  111, :element => "water", :weakness_element => "air", :strength_element => "fire" },
{:name => "Calcination", :damage_points => 89, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Red Mercury", :damage_points => 111, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Oxyacetylene", :damage_points => 105, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Spontanious Combustion", :damage_points => 100, :element => "fire", :weakness_element => "water", :strength_element => "earth" },
{:name => "Ground Quake", :damage_points => 108, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Body Slam", :damage_points => 115, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "CHA CHA CHA CHIA", :damage_points => 115, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Monolith of Doom", :damage_points => 100, :element => "earth", :weakness_element => "fire", :strength_element => "air" },
{:name => "Hurri-Pain", :damage_points => 75, :element => "air", :weakness_element => "earth", :strength_element => "water" },
{:name => "F-5", :damage_points => 99, :element => "air", :weakness_element => "earth", :strength_element => "water" },
{:name => "Sonic Boom", :damage_points => 109, :element => "air", :weakness_element => "earth", :strength_element => "water" },
{:name => "Smoke and Feathers", :damage_points => 107, :element => "air", :weakness_element => "earth", :strength_element => "water" }

]

CHARGED_ATTACKS.each {|charged_a| ChargedAttack.create(charged_a).save}

# 1 dactys
# 2 tauracs
# 3 trogbyte
# 4 pheonix



MONSTER_MASH = [
    {:name => "Leo", :user_id => 1, :head => Head.find(1), :arm => Arm.find(1), :leg => Leg.find(4), :back => Back.find(1) },
    {:name => "Raph", :user_id => 1, :head => Head.find(2), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Mikey", :user_id => 1, :head => Head.find(3), :arm => Arm.find(3), :leg => Leg.find(3), :back => Back.find(3) },

    {:name => "Donnie", :user_id => 2, :head => Head.find(4), :arm => Arm.find(3), :leg => Leg.find(4), :back => Back.find(2) },
    {:name => "Splinter", :user_id => 2, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(1), :back => Back.find(3) },
    {:name => "Casey", :user_id => 2, :head => Head.find(3), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(4) },

    {:name => "chad", :user_id => 3, :head => Head.find(4), :arm => Arm.find(1), :leg => Leg.find(1), :back => Back.find(1) },
    {:name => "cleo", :user_id => 3, :head => Head.find(2), :arm => Arm.find(2), :leg => Leg.find(2), :back => Back.find(4) },
    {:name => "Monkey-boy", :user_id => 3, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(4), :back => Back.find(3) },

    {:name => "Dolphin-face", :user_id => 4, :head => Head.find(4), :arm => Arm.find(3), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "chraklin", :user_id => 4, :head => Head.find(2), :arm => Arm.find(4), :leg => Leg.find(1), :back => Back.find(4) },
    {:name => "Clopskinburger", :user_id => 4, :head => Head.find(3), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(1) },

    {:name => "fran", :user_id => 5, :head => Head.find(3), :arm => Arm.find(1), :leg => Leg.find(4), :back => Back.find(4) },
    {:name => "pearl", :user_id => 5, :head => Head.find(2), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "edith", :user_id => 5, :head => Head.find(4), :arm => Arm.find(3), :leg => Leg.find(3), :back => Back.find(3) },

    {:name => "opal", :user_id => 6, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(4), :back => Back.find(4) },
    {:name => "beatrice", :user_id => 6, :head => Head.find(3), :arm => Arm.find(4), :leg => Leg.find(1), :back => Back.find(3) },
    {:name => "cassidy", :user_id => 6, :head => Head.find(4), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(1) },

    {:name => "Momochi-Sandayu", :user_id => 7, :head => Head.find(2), :arm => Arm.find(1), :leg => Leg.find(1), :back => Back.find(1) },
    {:name => "Ishikawa-Goemon", :user_id => 7, :head => Head.find(4), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Hattori-Hanzo", :user_id => 7, :head => Head.find(3), :arm => Arm.find(3), :leg => Leg.find(4), :back => Back.find(4) },
    
    {:name => "Tao", :user_id => 8, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Dr.Pol", :user_id => 8, :head => Head.find(2), :arm => Arm.find(1), :leg => Leg.find(4), :back => Back.find(3) },
    {:name => "Uma", :user_id => 8, :head => Head.find(4), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(4) }
]

# 1 dactys
# 2 tauracs
# 3 trogbyte
# 4 pheonix




MONSTER_MASH.each {|monster| Monster.create(monster).save}


Monster.all.each do |monster|
  
    monster.image = File.open("app/assets/images/#{monster.name}_image.png")
    monster.save
end


#= Monster.find()
#.image.attach(
#    io: File.open("app/assets/images/.png"),
#    filename: "nw.png"
#)
#.save

