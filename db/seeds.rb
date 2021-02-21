# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...")
spinner.auto_spin

coins = [
{
    description:"Bitcoin",
    acronym: "BTC",
    url_image:"https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg"},
{
    description:"Ethereum",
    acronym: "ETC",
    url_image:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png"},
{
    description:"Dash",
    acronym: "DASH",
    url_image:"https://cryptologos.cc/logos/dash-dash-logo.png"}
]

#find_or_create_by! => metodo do ActiveRecord que não deixa que um campo seja recriado caso ele já exista.
coins.each do |coin| 
    Coin.find_or_create_by!(coin)
end

spinner.success("(Concluído!)")