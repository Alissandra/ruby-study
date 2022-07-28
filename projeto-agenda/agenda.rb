# '@' cria uma variável de instância, asim vai poder ser acessado em todo o programa e '@@' cria uma variável de classe onde dá acesso em toda a classe
@agenda = [
    {nome: "Alissandra", telefone: "99999-9999"},
    {nome: "Fulano", telefone: "88888-8888"}
]

def todos_contatos
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
        puts "-----------------------------"
    end
end

def adicionar_contato
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp

    @agenda << {nome: nome, telefone: telefone}
end

def ver_contato
    print "Qual nome você deseja: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "#{contato[:nome]} - #{contato[:telefone]}"
            puts "-----------------------------"
        end       
    end
end

#método editar sem menu (modo mais resumido)
def editar_contato
    print "Qual nome deseja editar: "
    nome = gets.chomp
    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            print "Digite o nome para editar (Se quiser manter o mesmo nome, aperte 'Enter'): "
            nome_salvo = contato[:nome] #'nome_salvo' variável auxiliar para guardar o nome do contato antes de alterar
            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

            print "Digite o telefone para editar (Se quiser manter o mesmo telefone, aperte 'Enter'): "
            telefone_salvo = contato[:telefone] #'telefone_salvo' variável auxiliar para guardar o nome do contato antes de alterar
            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
    
end

#método editar com menu (modo extenso)
=begin
def editar_contato
    print "Qual contato deseja editar: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase) #dessa forma ele pesquisa tbm por nome aproximado, colocando p buscar pelas primeiras letras do nome ele vai trazer o primeiro nome q começa com as letras. Se quiser buscar pela nome exato, então seria 'if contato[:nome].downcase == (nome.downcase)'
            puts "#{contato[:nome]} - #{contato[:telefone]}"
            puts "-----------------------------"
                
            print "O que deseja editar:\n1. Nome\n2. Telefone\n3. Nome e Telefone\n0. Voltar ao menu inicial\n"
            opcao = gets.chomp.to_i

            case opcao
            when 1     
                print "Insira o novo nome: "
                novoNome = gets.chomp
                contato[:nome] = novoNome
                puts "#{contato[:nome]} - #{contato[:telefone]}"
                puts "-----------------------------"
                
            when 2
                print "Insira o novo telefone: "
                novoTelefone = gets.chomp
                contato[:telefone] = novoTelefone
                puts "#{contato[:nome]} - #{contato[:telefone]}"
                puts "-----------------------------"
                
            when 3
                print "Insira o novo nome: "
                novoNome = gets.chomp
                contato[:nome] = novoNome
                print "Insira o novo telefone: "
                novoTelefone = gets.chomp
                contato[:telefone] = novoTelefone
                puts "#{contato[:nome]} - #{contato[:telefone]}"
                puts "-----------------------------"
        
            when 0
                puts "Até mais"
                break        
            end
            
        end
    end
end
=end

def remover_contato
    print "Qual contato deseja remover: "
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase == (nome.downcase)
            indice = @agenda.index(contato) # o método 'index' vai trazer qual posição está o contato
            @agenda.delete_at(indice) #o método 'delete_at' precisa do argumento 'que posição deve ser deletado?'
            print "#{nome} foi removido!\n"
            break
        end
    end
end


loop do

puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
    codigo = gets.chomp.to_i
    
    case codigo
    when 0
        puts "Até mais"
        break
    when 1
        todos_contatos
    when 2
        adicionar_contato
    when 3
        ver_contato
    when 4
        editar_contato
    when 5
        remover_contato
    else
        puts "Função não existe, por favor use uma função válida!"
    end
end