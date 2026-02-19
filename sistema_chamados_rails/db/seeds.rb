# db/seeds.rb

puts "Seeding database..."

# Clear existing data
Chamado.destroy_all
Tecnico.destroy_all

# Create Tecnicos
tecnicos_names = [
  'Sidnei',
  'Antonio',
  'Richard',
  'Pedro',
  'Maxuel',
  'Dalva',
  'Edvaldo',
  'Diego',
  'Ailton',
  'Walter'
]

tecnicos = []
tecnicos_names.each do |nome|
  tecnicos << Tecnico.create!(nome: nome, ativo: true)
end

puts "Created #{Tecnico.count} technicians."

puts "Technicians seeded successfully."

# Create Users
User.create!(email_address: "admin@gov.br", password: "password", role: :admin) unless User.find_by(email_address: "admin@gov.br")
User.create!(email_address: "viewer@gov.br", password: "password", role: :viewer) unless User.find_by(email_address: "viewer@gov.br")

puts "Users (admin@gov.br / viewer@gov.br) seeded successfully."

# Create Specific Admin Users
admins = [
  { email: "Pedro@sudene.com.br", password: "sudene" },
  { email: "Dalva@sudene.com.br", password: "sudene" },
  { email: "Sidnei@sudene.com.br", password: "sudene" },
  { email: "Antonio@sudene.com.br", password: "sudene" },
  { email: "Richard@sudene.com.br", password: "sudene" },
  { email: "Davi@sudene.com.br", password: "sudene" },
  { email: "Diego@sudene.com.br", password: "sudene" }
]

admins.each do |admin_data|
  User.find_or_create_by!(email_address: admin_data[:email]) do |user|
    user.password = admin_data[:password]
    user.role = :admin
  end
end

puts "Created #{admins.count} specific admin users."

# Create Specific Viewer Users
viewers = [
  { email: "Maxuel@sudene.com.br", password: "sudene" },
  { email: "Edvaldo@sudene.com.br", password: "sudene" },
  { email: "Ailton@sudene.com.br", password: "sudene" },
  { email: "Walter@sudene.com.br", password: "sudene" },
  { email: "Livia@sudene.com.br", password: "sudene" }
]

viewers.each do |viewer_data|
  User.find_or_create_by!(email_address: viewer_data[:email]) do |user|
    user.password = viewer_data[:password]
    user.role = :viewer
  end
end

puts "Created #{viewers.count} specific viewer users."
# Chamado.destroy_all # Optional: Clear existing tickets if needed for fresh start

puts "Seeding completed!"
