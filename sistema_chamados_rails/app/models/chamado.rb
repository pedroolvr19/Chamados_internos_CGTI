class Chamado < ApplicationRecord
  has_many :chamado_historicos, dependent: :destroy

  before_update :registrar_historico_tecnico, if: :will_save_change_to_tecnico_responsavel?

  STATUS_OPCOES = [
    "Aberto",
    "Em Atendimento",
    "Aguardando Providência",
    "Fechado",
    "Cancelado"
  ]

  validates :nome_solicitante, :data_solicitacao, :hora_solicitacao, :descricao_solicitacao, presence: true
  validates :status, inclusion: { in: STATUS_OPCOES }

  scope :abertos, -> { where(status: "Aberto") }
  scope :em_atendimento, -> { where(status: "Em Atendimento") }
  scope :fechados, -> { where(status: "Fechado") }
  scope :recentes, -> { order(created_at: :desc) }

  def badge_class
    case status
    when "Aberto" then "bg-warning text-dark"
    when "Em Atendimento" then "bg-info text-dark"
    when "Aguardando Providência" then "bg-warning"
    when "Fechado" then "bg-success"
    when "Cancelado" then "bg-danger"
    else "bg-secondary"
    end
  end
  private

  def registrar_historico_tecnico
    ChamadoHistorico.create(
      chamado: self,
      tecnico_antigo: tecnico_responsavel_before_last_save || tecnico_responsavel_was,
      tecnico_novo: tecnico_responsavel,
      data_alteracao: Time.current
    )
  end
end
