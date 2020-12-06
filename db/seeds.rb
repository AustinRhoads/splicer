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

    ARMS = [
        {:name => "Dactys Claws", :element => "air", :dexterity => 2, :attack => 0, :counter => 0, :recoil => 0, :speed => 2},
        {:name => "Taurac Stompers", :element => "earth", :dexterity => 1, :attack => 3, :counter => 2, :recoil => 0, :speed => 1},
        {:name => "Trogbyte Hooks", :element => "water", :dexterity => 0, :attack => 2, :counter => 1, :recoil => 0, :speed => 0},
        {:name => "Pheonix Claws", :element => "fire", :dexterity => 1, :attack => 2, :counter => 1, :recoil => 1, :speed => 1}
    ]

    ARMS.each {|arm| Arm.create(arm)}

    LEGS = [
        {:name => "Dactys Talons", :element => "air", :dexterity => 2, :attack => 2, :counter => 1, :recoil => 0, :speed => 2},
        {:name => "Taurac Stompers", :element => "earth", :dexterity => 1, :attack => 3, :counter => 1, :recoil => 0, :speed => 1},
        {:name => "Trogbyte Crawlers", :element => "water", :dexterity => 2, :attack => 1, :counter => 1, :recoil => 1, :speed => 2},
        {:name => "Pheonix Clutches", :element => "fire", :dexterity => 2, :attack => 2, :counter => 0, :recoil => 1, :speed => 1}
    ]

    LEGS.each  {|leg| Leg.create(leg)}

    BACKS = [
        {:name => "Dactys wings", :element => "air", :dexterity => 2, :attack => 1, :counter => 0, :recoil => 0, :speed => 1},
        {:name => "shell", :element => "earth", :dexterity => 1, :attack => 1, :counter => 2, :recoil => 0, :speed => 0},
        {:name => "spikes", :element => "water", :dexterity => 0, :attack => 1, :counter => 1, :recoil => 1, :speed => 1},
        {:name => "Pheonix wings", :element => "fire", :dexterity => 2, :attack => 2, :counter => 0, :recoil => 1, :speed => 2}
    ]

    BACKS.each {|back| Back.create(back)}


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




MONSTER_MASH = [
    {:name => "Leo", :user_id => 1, :head => Head.find(1), :arm => Arm.find(1), :leg => Leg.find(4), :back => Back.find(1) },
    {:name => "Raph", :user_id => 1, :head => Head.find(2), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Mikey", :user_id => 1, :head => Head.find(3), :arm => Arm.find(3), :leg => Leg.find(3), :back => Back.find(3) },

    {:name => "Donnie", :user_id => 2, :head => Head.find(4), :arm => Arm.find(3), :leg => Leg.find(4), :back => Back.find(2) },
    {:name => "Splinter", :user_id => 2, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(1), :back => Back.find(3) },
    {:name => "Casey", :user_id => 2, :head => Head.find(3), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(4) },

    {:name => "chad", :user_id => 3, :head => Head.find(4), :arm => Arm.find(1), :leg => Leg.find(1), :back => Back.find(1) },
    {:name => "cleo", :user_id => 3, :head => Head.find(2), :arm => Arm.find(2), :leg => Leg.find(2), :back => Back.find(4) },
    {:name => "Monkey boy", :user_id => 3, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(4), :back => Back.find(3) },

    {:name => "Dolphin face", :user_id => 4, :head => Head.find(4), :arm => Arm.find(3), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "chraklin", :user_id => 4, :head => Head.find(2), :arm => Arm.find(4), :leg => Leg.find(1), :back => Back.find(4) },
    {:name => "Clopskinburger", :user_id => 4, :head => Head.find(3), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(1) },

    {:name => "fran", :user_id => 5, :head => Head.find(3), :arm => Arm.find(1), :leg => Leg.find(4), :back => Back.find(4) },
    {:name => "pearl", :user_id => 5, :head => Head.find(2), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "edith", :user_id => 5, :head => Head.find(4), :arm => Arm.find(3), :leg => Leg.find(3), :back => Back.find(3) },

    {:name => "opal", :user_id => 6, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(4), :back => Back.find(4) },
    {:name => "beatrice", :user_id => 6, :head => Head.find(3), :arm => Arm.find(4), :leg => Leg.find(1), :back => Back.find(3) },
    {:name => "cassidy", :user_id => 6, :head => Head.find(4), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(1) },

    {:name => "Momochi Sandayu", :user_id => 7, :head => Head.find(2), :arm => Arm.find(1), :leg => Leg.find(1), :back => Back.find(1) },
    {:name => "Ishikawa Goemon", :user_id => 7, :head => Head.find(4), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Hattori Hanzo", :user_id => 7, :head => Head.find(3), :arm => Arm.find(3), :leg => Leg.find(4), :back => Back.find(4) },
    
    {:name => "Tao", :user_id => 8, :head => Head.find(1), :arm => Arm.find(4), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Dr. pol", :user_id => 8, :head => Head.find(2), :arm => Arm.find(1), :leg => Leg.find(4), :back => Back.find(3) },
    {:name => "Uma Thurman", :user_id => 8, :head => Head.find(4), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(4) }
]

MONSTER_MASH.each {|monster| Monster.create(monster).save}
