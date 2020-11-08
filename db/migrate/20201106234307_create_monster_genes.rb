class CreateMonsterGenes < ActiveRecord::Migration[6.0]
  def change
    create_table :monster_genes do |t|
      t.integer :monster_id
      t.integer :gene_id

      t.timestamps
    end
  end
end
