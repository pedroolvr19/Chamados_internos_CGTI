class CreateChamadoHistoricos < ActiveRecord::Migration[8.0]
  def change
    create_table :chamado_historicos do |t|
      t.references :chamado, null: false, foreign_key: true
      t.string :tecnico_antigo
      t.string :tecnico_novo
      t.datetime :data_alteracao

      t.timestamps
    end
  end
end
