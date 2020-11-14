class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.belongs_to :user, foriegn_key: true
      t.belongs_to :head, foriegn_key: true
      t.belongs_to :arm, foriegn_key: true
      t.belongs_to :leg, foriegn_key: true
      t.belongs_to :back, foriegn_key: true
      t.belongs_to :fast_attack, foriegn_key: true
      t.belongs_to :charged_attack, foriegn_key: true
      t.string :element
      t.integer :hp
      t.integer :current_hp
      t.integer :dexterity, default: 0
      t.integer :attack, default: 0
      t.integer :counter, default: 0
      t.integer :recoil, default: 0
      t.integer :speed, default: 0
      t.integer :charger, default: 0
      t.timestamps
    end
  end
end
