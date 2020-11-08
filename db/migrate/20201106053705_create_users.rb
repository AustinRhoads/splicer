class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :experience_points, default: 0
      t.integer :level, default: 1
      t.timestamps
    end
  end
end
