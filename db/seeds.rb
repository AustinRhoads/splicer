# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    mari = User.create(:name => "Marilyn")
    aush = User.create(:name => "Austin")
    sid = User.create(:name => "Sidney")

    HEADS = [
        {:name => "Dactys_head", :element => "air", :dexterity => 2, :attack => 1, :counter => 0, :recoil => 1, :speed => 2},
        {:name => "Taurac_head", :element => "earth", :dexterity => 1, :attack => 2, :counter => 2, :recoil => 0, :speed => 1},
        {:name => "Trogbyte_head", :element => "water", :dexterity => 0, :attack => 2, :counter => 1, :recoil => 2, :speed => 0}
    ]

    HEADS.each {|head| Head.create(head)}

    ARMS = [
        {:name => "Dactys_arm", :element => "air", :dexterity => 2, :attack => 0, :counter => 0, :recoil => 0, :speed => 2},
        {:name => "Taurac_arm", :element => "earth", :dexterity => 1, :attack => 3, :counter => 2, :recoil => 0, :speed => 1},
        {:name => "Trogbyte_arm", :element => "water", :dexterity => 0, :attack => 2, :counter => 1, :recoil => 0, :speed => 0}
    ]

    ARMS.each {|arm| Arm.create(arm)}

    LEGS = [
        {:name => "Dactys_leg", :element => "air", :dexterity => 2, :attack => 2, :counter => 1, :recoil => 0, :speed => 2},
        {:name => "Taurac_leg", :element => "earth", :dexterity => 1, :attack => 3, :counter => 1, :recoil => 0, :speed => 1},
        {:name => "Trogbyte_leg", :element => "water", :dexterity => 2, :attack => 1, :counter => 1, :recoil => 1, :speed => 2}
    ]

    LEGS.each  {|leg| Leg.create(leg)}

    BACKS = [
        {:name => "wings", :element => "air", :dexterity => 2, :attack => 1, :counter => 0, :recoil => 0, :speed => 2},
        {:name => "shell", :element => "earth", :dexterity => 1, :attack => 1, :counter => 2, :recoil => 0, :speed => 0},
        {:name => "spikes", :element => "water", :dexterity => 0, :attack => 1, :counter => 1, :recoil => 1, :speed => 1}
    ]

    BACKS.each {|back| Back.create(back)}


MONSTER_MASH = [
    {:name => "Leo", :user_id => 1, :head => Head.find(1), :arm => Arm.find(1), :leg => Leg.find(1), :back => Back.find(1) },
    {:name => "Raph", :user_id => 2, :head => Head.find(2), :arm => Arm.find(2), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Mikey", :user_id => 3, :head => Head.find(3), :arm => Arm.find(3), :leg => Leg.find(3), :back => Back.find(3) },
    {:name => "Donnie", :user_id => 1, :head => Head.find(1), :arm => Arm.find(3), :leg => Leg.find(2), :back => Back.find(2) },
    {:name => "Splinter", :user_id => 2, :head => Head.find(2), :arm => Arm.find(1), :leg => Leg.find(1), :back => Back.find(3) },
    {:name => "Casey", :user_id => 3, :head => Head.find(3), :arm => Arm.find(2), :leg => Leg.find(3), :back => Back.find(1) }
]

MONSTER_MASH.each {|monster| Monster.create(monster).save}