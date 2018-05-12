def avisa_chute_efetuado(chute)
    puts "Você já chutou #{chute}"
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


def pede_um_chute(erros, chutes)
    puts "\n\n\n"
    puts "Erros até agora #{erros}"
    puts "Você já chutou #{chutes}"
    puts "Chute uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que acertou?"
    return chute
end
