class ChamadosController < ApplicationController
  before_action :set_chamado, only: %i[ show edit update destroy ]

  # GET /chamados
  def index
    redirect_to root_path
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
    @chamado = Chamado.new(chamado_params)
    # Status defaults to 'Aberto' if not set, or respects form selection

    if @chamado.save
      redirect_to @chamado, notice: "Chamado criado com sucesso."
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
