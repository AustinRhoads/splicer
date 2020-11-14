class CreateFastAttacks < ActiveRecord::Migration[6.0]
  def change
    create_table :fast_attacks do |t|
      t.string :name
      t.integer :damage_points
      t.string :element
      t.string :weakness_element
      t.string :strength_element

      t.timestamps
    end
  end
end
