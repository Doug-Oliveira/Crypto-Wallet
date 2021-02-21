namespace :dev do
  desc "Configura o ambiente de Dev"
  task setup: :environment do

#as {} abaixo tambem podem ser substituidas por do end, foi usado {} porque so tem uma linha de código
  if Rails.env.development?
    show_spinner("Apagando BD") {%x(rails db:drop)}
    show_spinner("Criando BD") {%x(rails db:create)}
    show_spinner("Migrand BD") {%x(rails db:migrate)}
    show_spinner("Populando BD") {%x(rails db:seed)}
  else
  puts "!--Você não esta em Ambiente de Desenvolvimento--!"
    end
  end

  private
  def show_spinner(msg_start, msg_end = "Concluido com sucesso!!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
