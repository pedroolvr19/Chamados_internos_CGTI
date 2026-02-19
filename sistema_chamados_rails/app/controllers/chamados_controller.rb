class ChamadosController < ApplicationController
  load_and_authorize_resource
  before_action :require_authentication

  # GET /chamados
  def index
    @chamados = @chamados.recentes

    if params[:status].present?
      @chamados = @chamados.where(status: params[:status])
    end

    if params[:tecnico].present?
      @chamados = @chamados.where(tecnico_responsavel: params[:tecnico])
    end

    respond_to do |format|
      format.html { redirect_to root_path } unless current_user # Should be handled by require_authentication
      format.html # Render index if authorized (though root_path redirect logic in original was weird, maybe preserving intended flow?)
      # Wait, original index redirected to root_path for HTML?
      # "format.html { redirect_to root_path }" - yes. Let's keep it if that's the design.
      # User might want to see the list on /chamados only for debugging or specific roles?
      # If Viewer can read, they might see it.
      # Let's assume standard behavior unless specific reason. 
      # Original code:
      # format.html { redirect_to root_path }
      # format.pdf ...
      
      # If the intention is that /chamados is not a viewable page for HTML, then redirecting to root is fine.
      
      format.html { redirect_to root_path }
      format.pdf do
        render pdf: "chamados", template: "chamados/index", formats: [:pdf]
      end
    end
  end

  # GET /chamados/1
  def show
  end

  # GET /chamados/new
  def new
    # @chamado is initialized by load_and_authorize_resource
    @chamado.data_solicitacao ||= Date.today
    @chamado.hora_solicitacao ||= Time.now.change(sec: 0)
  end

  # GET /chamados/1/edit
  def edit
  end

  # POST /chamados
  def create
    # @chamado is initialized with calling resource_params (chamado_params) by CanCanCan
    @chamado.status = 'Aberto' if @chamado.status.blank?

    if @chamado.save
      redirect_to root_path, notice: "Chamado criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chamados/1
  def update
    # @chamado is loaded
    if @chamado.update(chamado_params)
      redirect_to @chamado, notice: "Chamado atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /chamados/1
  def destroy
    @chamado.destroy
    redirect_to root_path, notice: "Chamado deletado com sucesso.", status: :see_other
  end

  private
    # set_chamado removed (handled by CanCanCan)

    def chamado_params
      params.require(:chamado).permit(
        :data_solicitacao, :hora_solicitacao, :nome_solicitante, :ramal, :setor, :andar,
        :descricao_solicitacao, :detalhe, :status, :tecnico_responsavel,
        :constatado, :providencia, :providenciado, :data_fechamento
      )
    end
end
