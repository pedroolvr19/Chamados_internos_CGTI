class CreateTecnicos < ActiveRecord::Migration[8.0]
  def change
    create_table :tecnicos do |t|
      t.string :nome
      t.boolean :ativo

      t.timestamps
    end
    add_index :tecnicos, :nome
  end
end
