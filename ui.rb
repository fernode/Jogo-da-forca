def avisa_chute_efetuado(chute)
    puts "Você já chutou #{chute}"
end

def avisa_letra_nao_encontrada(chute)
    puts "Letra #{chute} não encontrada na palavra secreta"
end

def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada na palavra #{total_encontrado} vezes"
end

def avisa_acertou_a_palavra
    puts "Acertou"
end

def avisa_nao_acertou_a_palavra
    puts "Não foi dessa vez, você errou!"
end

def avisa_pontos(nome,pontos_ate_agora)
    puts "#{nome} ganhou #{pontos_ate_agora} pontos até agora"
end

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


def cabecalho_de_tentativa(erros, chutes, mascara)
    puts "\n\n\n"
    puts "A palavra nossa secreta é : #{mascara}"
    puts "Erros até agora #{erros}"
    puts "Você já chutou #{chutes}"
end

def pede_um_chute
    puts "Chute uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que acertou?"
    return chute
end
