class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.integer :level
      t.boolean :user_won, default: false
      t.timestamps
    end
  end
end
