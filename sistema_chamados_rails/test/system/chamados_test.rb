require "application_system_test_case"

class ChamadosTest < ApplicationSystemTestCase
  setup do
    @chamado = chamados(:one)
  end

  test "visiting the index" do
    visit chamados_url
    assert_selector "h1", text: "Chamados"
  end

  test "should create chamado" do
    visit chamados_url
    click_on "New chamado"

    fill_in "Andar", with: @chamado.andar
    fill_in "Constatado", with: @chamado.constatado
    fill_in "Data fechamento", with: @chamado.data_fechamento
    fill_in "Data solicitacao", with: @chamado.data_solicitacao
    fill_in "Descricao solicitacao", with: @chamado.descricao_solicitacao
    fill_in "Detalhe", with: @chamado.detalhe
    fill_in "Hora solicitacao", with: @chamado.hora_solicitacao
    fill_in "Nome solicitante", with: @chamado.nome_solicitante
    fill_in "Providencia", with: @chamado.providencia
    fill_in "Providenciado", with: @chamado.providenciado
    fill_in "Ramal", with: @chamado.ramal
    fill_in "Setor", with: @chamado.setor
    fill_in "Status", with: @chamado.status
    fill_in "Tecnico responsavel", with: @chamado.tecnico_responsavel
    click_on "Create Chamado"

    assert_text "Chamado was successfully created"
    click_on "Back"
  end

  test "should update Chamado" do
    visit chamado_url(@chamado)
    click_on "Edit this chamado", match: :first

    fill_in "Andar", with: @chamado.andar
    fill_in "Constatado", with: @chamado.constatado
    fill_in "Data fechamento", with: @chamado.data_fechamento.to_s
    fill_in "Data solicitacao", with: @chamado.data_solicitacao
    fill_in "Descricao solicitacao", with: @chamado.descricao_solicitacao
    fill_in "Detalhe", with: @chamado.detalhe
    fill_in "Hora solicitacao", with: @chamado.hora_solicitacao.to_s
    fill_in "Nome solicitante", with: @chamado.nome_solicitante
    fill_in "Providencia", with: @chamado.providencia
    fill_in "Providenciado", with: @chamado.providenciado
    fill_in "Ramal", with: @chamado.ramal
    fill_in "Setor", with: @chamado.setor
    fill_in "Status", with: @chamado.status
    fill_in "Tecnico responsavel", with: @chamado.tecnico_responsavel
    click_on "Update Chamado"

    assert_text "Chamado was successfully updated"
    click_on "Back"
  end

  test "should destroy Chamado" do
    visit chamado_url(@chamado)
    click_on "Destroy this chamado", match: :first

    assert_text "Chamado was successfully destroyed"
  end
end
