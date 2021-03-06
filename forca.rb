require_relative "ui.rb"

def salva_rank(nome, pontos_totais)
    conteudo = "Jogador #{nome}\n pontos totais #{pontos_totais}"
    File.write("rank.txt",conteudo)
end

def escolhe_palavra_secreta
    avisa_escolhendo_palavra
    texto = File.read("dicionario.txt")
    todas_as_palavras = texto.split("\n")
    numero_escolhido = rand(todas_as_palavras.size)
    palavra_secreta = todas_as_palavras[numero_escolhido]
    avisa_palavra_escolhida palavra_secreta
    return palavra_secreta.downcase
end

def palavra_mascarada(chutes, palavra_secreta)
    mascara = ""
    for letra in palavra_secreta.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end
    mascara
end

def pede_um_chute_valido(erros,chutes, mascara)
    cabecalho_de_tentativa(erros, chutes, mascara)
    loop do
        chute = pede_um_chute
        if chutes.include? chute
            avisa_chute_efetuado chute
        else
            return chute
        end
    end
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    pontos_ate_agora = 0
    chutes = []

    while erros < 5
        mascara = palavra_mascarada chutes, palavra_secreta
        chute = pede_um_chute_valido erros,chutes,mascara
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            total_encontrado = palavra_secreta.count chute

            if total_encontrado == 0
                avisa_letra_nao_encontrada chute 
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
            end

        else
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_a_palavra
                pontos_ate_agora += 100
                break
            else
                avisa_nao_acertou_a_palavra
                erros += 1
                pontos_ate_agora -= 30
            end
        end
    end

    avisa_pontos nome,pontos_ate_agora
    pontos_ate_agora
end

def jogo_da_forca
    nome = da_boas_vindas
    pontos_totais = 0

    loop do
        pontos_totais += joga nome
        avisa_pontos_totais pontos_totais

        salva_rank nome, pontos_totais

        nao_quero_jogar = nao_quer_jogar?
        if nao_quero_jogar
            break
        end
    end
end