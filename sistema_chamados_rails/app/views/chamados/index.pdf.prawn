prawn_document(page_layout: :landscape) do |pdf|
  pdf.text "Relatório de Chamados", size: 20, style: :bold, align: :center
  pdf.move_down 20

  pdf.text "Gerado em: #{Time.now.strftime('%d/%m/%Y %H:%M')}", size: 10, align: :right
  pdf.move_down 10

  table_data = []
  table_data << ["ID", "Data/Hora", "Solicitante", "Setor", "Status", "Técnico"]

  @chamados.each do |chamado|
    table_data << [
      chamado.id.to_s,
      "#{chamado.data_solicitacao&.strftime('%d/%m/%Y')} #{chamado.hora_solicitacao&.strftime('%H:%M')}",
      chamado.nome_solicitante,
      chamado.setor,
      chamado.status,
      chamado.tecnico_responsavel.presence || "-"
    ]
  end

  pdf.table(table_data, header: true, width: pdf.bounds.width) do
    row(0).font_style = :bold
    row(0).background_color = "EEEEEE"
    self.header = true
  end
end
