class CreateArms < ActiveRecord::Migration[6.0]
  def change
    create_table :arms do |t|
      t.string :name
      t.string :element
      t.integer :dexterity
      t.integer :attack
      t.integer :counter
      t.integer :recoil
      t.integer :speed

      t.timestamps
    end
  end
end
