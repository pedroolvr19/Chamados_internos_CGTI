class CreateChamados < ActiveRecord::Migration[8.0]
  def change
    create_table :chamados do |t|
      t.date :data_solicitacao
      t.time :hora_solicitacao
      t.string :nome_solicitante
      t.string :ramal
      t.string :setor
      t.string :andar
      t.text :descricao_solicitacao
      t.text :constatado
      t.text :providencia
      t.text :providenciado
      t.string :status
      t.text :detalhe
      t.string :tecnico_responsavel
      t.datetime :data_fechamento

      t.timestamps
    end
  end
end
