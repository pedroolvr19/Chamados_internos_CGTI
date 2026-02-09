# db/seeds.rb

puts "Seeding database..."

# Clear existing data
Chamado.destroy_all
Tecnico.destroy_all

# Create Tecnicos
tecnicos_names = [
  'Sidney',
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
# Chamado.destroy_all # Optional: Clear existing tickets if needed for fresh start

puts "Seeding completed!"
