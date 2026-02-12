class ChamadosController < ApplicationController
  before_action :require_authentication
  before_action :require_admin, only: %i[ new create edit update destroy ]
  before_action :set_chamado, only: %i[ show edit update destroy ]

  # GET /chamados
  def index
    # Filter logic similar to dashboard
    @chamados = Chamado.all.order(created_at: :desc)

    if params[:status].present?
      @chamados = @chamados.where(status: params[:status])
    end

    if params[:tecnico].present?
      @chamados = @chamados.where(tecnico_responsavel: params[:tecnico])
    end

    respond_to do |format|
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
    @chamado = Chamado.new
    @chamado.data_solicitacao = Date.today
    @chamado.hora_solicitacao = Time.now.change(sec: 0)
  end

  # GET /chamados/1/edit
  def edit
  end

  # POST /chamados
  def create
    @chamado = Chamado.new(chamado_params)
    @chamado.status = 'Aberto' if @chamado.status.blank?

    if @chamado.save
      redirect_to root_path, notice: "Chamado criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chamados/1
  def update
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
    def set_chamado
      @chamado = Chamado.find(params[:id])
    end

    def chamado_params
      params.require(:chamado).permit(
        :data_solicitacao, :hora_solicitacao, :nome_solicitante, :ramal, :setor, :andar,
        :descricao_solicitacao, :detalhe, :status, :tecnico_responsavel,
        :constatado, :providencia, :providenciado, :data_fechamento
      )
    end
end
