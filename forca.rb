def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual o seu nome?"
    nome = gets.strip
    puts "\n\n\n"
    puts "Começaremos o jogo para você #{nome}"
    return nome
end

def escolhe_palavra_secreta
    puts "Escolhendo palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras"
    puts "\n\n\n"
    return palavra_secreta
end

def nao_quer_jogar?
    puts "Deseja jogar novamente? [S/N]"
    quero_jogar = gets.strip
    return nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas

def pede_um_chute(erros, chutes)
    puts "\n\n\n"
    puts "Erros até agora #{erros}"
    puts "Você já chutou #{chutes}"
    puts "Chute uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que acertou?"
    return chute
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    pontos_ate_agora = 0
    chutes = []

    while erros < 5
        chute = pede_um_chute erros, chutes
        if chutes.include? chute
            puts "Você já chutou #{chute}"
            next
        end
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            # letra_procurada = chute[0]
            # total_encontrado = 0

            # for i in 0..(palavra_secreta.size - 1)
            #     if palavra_secreta[i] == letra_procurada
            #         total_encontrado += 1
            #     end
            # end  
            
            total_encontrado = palavra_secreta.count chute

            if total_encontrado == 0
                puts "Letra #{chute} não encontrada na palavra secreta"
                erros += 1
            else
                puts "Letra #{chute} encontrada na palavra #{total_encontrado} vezes"
            end

        else
            acertou = chute == palavra_secreta
            if acertou
                puts "Acertou"
                pontos_ate_agora += 100
                break
            else
                puts "Não foi dessa vez, você errou!"
                erros += 1
                pontos_ate_agora -= 30
            end
        end
    end
    puts "#{nome} ganhou #{pontos_ate_agora} pontos até agora"

end

loop do
    joga nome
    nao_quero_jogar = nao_quer_jogar?
    if nao_quero_jogar
        break
    end
end