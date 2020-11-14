class CreateBattleUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :battle_users do |t|
      t.integer :user_id
      t.integer :battle_id

      t.timestamps
    end
  end
end
