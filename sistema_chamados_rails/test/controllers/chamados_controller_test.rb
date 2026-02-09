require "test_helper"

class ChamadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chamado = chamados(:one)
  end

  test "should get index" do
    get chamados_url
    assert_response :success
  end

  test "should get new" do
    get new_chamado_url
    assert_response :success
  end

  test "should create chamado" do
    assert_difference("Chamado.count") do
      post chamados_url, params: { chamado: { andar: @chamado.andar, constatado: @chamado.constatado, data_fechamento: @chamado.data_fechamento, data_solicitacao: @chamado.data_solicitacao, descricao_solicitacao: @chamado.descricao_solicitacao, detalhe: @chamado.detalhe, hora_solicitacao: @chamado.hora_solicitacao, nome_solicitante: @chamado.nome_solicitante, providencia: @chamado.providencia, providenciado: @chamado.providenciado, ramal: @chamado.ramal, setor: @chamado.setor, status: @chamado.status, tecnico_responsavel: @chamado.tecnico_responsavel } }
    end

    assert_redirected_to chamado_url(Chamado.last)
  end

  test "should show chamado" do
    get chamado_url(@chamado)
    assert_response :success
  end

  test "should get edit" do
    get edit_chamado_url(@chamado)
    assert_response :success
  end

  test "should update chamado" do
    patch chamado_url(@chamado), params: { chamado: { andar: @chamado.andar, constatado: @chamado.constatado, data_fechamento: @chamado.data_fechamento, data_solicitacao: @chamado.data_solicitacao, descricao_solicitacao: @chamado.descricao_solicitacao, detalhe: @chamado.detalhe, hora_solicitacao: @chamado.hora_solicitacao, nome_solicitante: @chamado.nome_solicitante, providencia: @chamado.providencia, providenciado: @chamado.providenciado, ramal: @chamado.ramal, setor: @chamado.setor, status: @chamado.status, tecnico_responsavel: @chamado.tecnico_responsavel } }
    assert_redirected_to chamado_url(@chamado)
  end

  test "should destroy chamado" do
    assert_difference("Chamado.count", -1) do
      delete chamado_url(@chamado)
    end

    assert_redirected_to chamados_url
  end
end
