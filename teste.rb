def fazer_salada

yield "sal"
yield "oregano"
yield "tomate"

end

fazer_salada do |ingrediente|    
    puts "Adicionando #{ingrediente} a salada"
end

fazer_salada{|ingrediente|puts "Adicionando #{ingrediente} a salada"}