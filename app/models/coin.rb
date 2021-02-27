class Coin < ApplicationRecord

#belongs_to => campo mining_type possui um id que faz referencia a tabela mining_type
belongs_to :mining_type

end
  