class Tecnico < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  
  scope :ativos, -> { where(ativo: true) }

  def self.nomes_ativos
    ativos.pluck(:nome)
  end
end
