class CreateBattleParties < ActiveRecord::Migration[6.0]
  def change
    create_table :battle_parties do |t|
     # t.belongs_to :user, null: false, foreign_key: true
      t.integer :user_id
      t.timestamps
    end
  end
end
