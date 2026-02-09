json.extract! chamado, :id, :data_solicitacao, :hora_solicitacao, :nome_solicitante, :ramal, :setor, :andar, :descricao_solicitacao, :constatado, :providencia, :providenciado, :status, :detalhe, :tecnico_responsavel, :data_fechamento, :created_at, :updated_at
json.url chamado_url(chamado, format: :json)
