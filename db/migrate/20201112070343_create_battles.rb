class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|

      t.timestamps
    end
  end
end
