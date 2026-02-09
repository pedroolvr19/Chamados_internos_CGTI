# verify_full_system.rb
puts "Verifying Full System..."

begin
  # 1. Verify Tecnicos
  puts "\nChecking Tecnicos..."
  if Tecnico.count == 0
    puts "No technicians found. Seeding..."
    Tecnico.create!(nome: "Test Tech", ativo: true)
  end
  puts "Technicians: #{Tecnico.count}"
  puts "Active Technicians: #{Tecnico.nomes_ativos.join(', ')}"

  # 2. Verify Chamado Creation
  puts "\nCreating a new ticket..."
  chamado = Chamado.create!(
    nome_solicitante: "Validador do Sistema",
    data_solicitacao: Date.today,
    hora_solicitacao: Time.now,
    descricao_solicitacao: "Teste automatizado de verificação.",
    status: "Aberto",
    setor: "TI",
    ramal: "1234"
  )
  puts "Ticket created! ID: #{chamado.id}"

  # 3. Verify Scopes
  puts "\nChecking Scopes..."
  puts "Abertos: #{Chamado.abertos.count}"
  puts "Em Atendimento: #{Chamado.em_atendimento.count}"
  puts "Fechados: #{Chamado.fechados.count}"

  # 4. Verify Updates
  puts "\nUpdating ticket status..."
  chamado.update!(
    status: "Fechado",
    tecnico_responsavel: Tecnico.first.nome,
    constatado: "Defeito de software.",
    providencia: "Reinstalação.",
    providenciado: "OK.",
    data_fechamento: Time.now
  )
  puts "Ticket updated to 'Fechado'."

  # 5. Verify Badge Helper
  puts "\nVerifying Badge Helper..."
  puts "Badge Class: #{chamado.badge_class}"
  
  puts "\nVerification FULLY BASIC SUCCESS!"

rescue => e
  puts "\nERROR: Verification failed!"
  puts e.message
  puts e.backtrace
  exit 1
end
