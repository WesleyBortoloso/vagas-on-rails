puts "🔄 Limpando dados antigos..."
Application.delete_all
Job.delete_all
Company.delete_all
Candidate.delete_all

puts "🏢 Criando empresas..."

companies = [
  Company.create!(name: "TechCorp", description: "Empresa de tecnologia focada em soluções web."),
  Company.create!(name: "BioHealth", description: "Startup da área da saúde e biotecnologia."),
  Company.create!(name: "EduPlus", description: "Plataforma de educação online.")
]

puts "💼 Criando vagas..."

jobs = [
  Job.create!(title: "Desenvolvedor Fullstack", description: "Desenvolver aplicações Ruby on Rails com React.", company: companies[0]),
  Job.create!(title: "Analista de Dados", description: "Trabalhar com dados e dashboards.", company: companies[0]),
  Job.create!(title: "Pesquisador Biomédico", description: "Atuar em laboratório de pesquisas clínicas.", company: companies[1]),
  Job.create!(title: "Desenvolvedor Python", description: "Projetos com Django e Flask.", company: companies[1]),
  Job.create!(title: "Instrutor de Programação", description: "Ministrar aulas online de back-end.", company: companies[2]),
  Job.create!(title: "Designer Instrucional", description: "Desenvolver materiais didáticos interativos.", company: companies[2])
]

puts "🙋 Criando candidatos..."

candidates = [
  Candidate.create!(name: "Ana Paula", email: "ana@example.com", resume: "Engenheira de Software com 5 anos de experiência."),
  Candidate.create!(name: "João Vitor", email: "joao@example.com", resume: "Analista de dados com experiência em BI e SQL."),
  Candidate.create!(name: "Marina Costa", email: "marina@example.com", resume: "Bióloga com mestrado em biotecnologia."),
  Candidate.create!(name: "Lucas Ribeiro", email: "lucas@example.com", resume: "Desenvolvedor fullstack Ruby e Vue.js.")
]

puts "📄 Criando candidaturas..."

Application.create!(candidate: candidates[0], job: jobs[0], status: "pending")
Application.create!(candidate: candidates[1], job: jobs[1], status: "pending")
Application.create!(candidate: candidates[1], job: jobs[4], status: "pending")
Application.create!(candidate: candidates[2], job: jobs[2], status: "approved")
Application.create!(candidate: candidates[2], job: jobs[3], status: "rejected")
Application.create!(candidate: candidates[3], job: jobs[0], status: "pending")

puts "✅ Seed finalizado com sucesso!"
