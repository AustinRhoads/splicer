class CreateGenes < ActiveRecord::Migration[6.0]
  def change
    create_table :genes do |t|
      t.string :name
      t.string :element
      t.timestamps
    end
  end
end
