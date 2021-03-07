namespace :dev do
  desc "Configura o ambiente de Dev"
  task setup: :environment do

#as {} abaixo tambem podem ser substituidas por do end, foi usado {} porque so tem uma linha de código
  if Rails.env.development?
    show_spinner("Apagando BD") {%x(rails db:drop)}
    show_spinner("Criando BD") {%x(rails db:create)}
    show_spinner("Migrand BD") {%x(rails db:migrate)}
    %x(rails dev:add_mining_types)
    %x(rails dev:add_coins)
    
  else
  puts "!--Você não esta em Ambiente de Desenvolvimento--!"
    end
  end

  #task para cadastrar as moedas
  desc "Cadastrar as Moedas"
  task add_coins: :environment do

    show_spinner("Cadastrando Moedas...") do

  coins = [
  {
      description:"Bitcoin",
      acronym: "BTC",
      url_image:"https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg",
      mining_type: MiningType.find_by(acronym: 'PoW')},
  {
      description:"Ethereum",
      acronym: "ETC",
      url_image:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png",
      mining_type: MiningType.all.sample},
  {
      description:"Dash",
      acronym: "DASH",
      url_image:"https://cryptologos.cc/logos/dash-dash-logo.png",
      mining_type: MiningType.all.sample}
  ]

#find_or_create_by! => metodo do ActiveRecord que não deixa que um campo seja recriado caso ele já exista.
   coins.each do |coin| 
       Coin.find_or_create_by!(coin)
  end
 end
end

desc "Cadastrar Tipos de Mineração"
task add_mining_types: :environment do

  show_spinner("Cadastrando Tipos de Mineração") do
  mining_types = [
    {
      description: "Proof of Work", 
      acronym: "PoW"},
    {
      description: "Proof of Stake", 
      acronym: "PoS"},
    {
      description: "Proof of Capacity", 
      acronym: "PoC"}
    ]

    mining_types.each do |mining_type| 
      MiningType.find_or_create_by!(mining_type)
  end
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
