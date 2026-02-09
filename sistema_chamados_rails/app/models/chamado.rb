class Chamado < ApplicationRecord
  STATUS_OPCOES = [
    'Aberto',
    'Em Atendimento',
    'Aguardando Providência',
    'Fechado',
    'Cancelado'
  ]

  validates :nome_solicitante, :data_solicitacao, :hora_solicitacao, :descricao_solicitacao, presence: true
  validates :status, inclusion: { in: STATUS_OPCOES }

  scope :abertos, -> { where(status: 'Aberto') }
  scope :em_atendimento, -> { where(status: 'Em Atendimento') }
  scope :fechados, -> { where(status: 'Fechado') }
  scope :recentes, -> { order(created_at: :desc) }

  def badge_class
    case status
    when 'Aberto' then 'bg-warning text-dark'
    when 'Em Atendimento' then 'bg-info text-dark'
    when 'Aguardando Providência' then 'bg-warning'
    when 'Fechado' then 'bg-success'
    when 'Cancelado' then 'bg-danger'
    else 'bg-secondary'
    end
  end
end
