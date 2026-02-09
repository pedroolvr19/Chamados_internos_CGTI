class DashboardController < ApplicationController
  def index
    @total_chamados = Chamado.count
    @chamados_abertos = Chamado.abertos.count
    @chamados_em_atendimento = Chamado.em_atendimento.count
    @chamados_fechados = Chamado.fechados.count

    @chamados = Chamado.recentes

    # Filters
    if params[:status].present?
      @chamados = @chamados.where(status: params[:status])
    end

    if params[:tecnico].present?
      @chamados = @chamados.where(tecnico_responsavel: params[:tecnico])
    end
  end
end
