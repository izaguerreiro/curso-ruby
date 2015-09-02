# coding: utf-8

def da_boas_vindas
	puts "Bem vindo ao jogo da forca"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n\n"
	puts "Começaremos o jogo para você, #{nome}"
	nome
end

def pede_um_chute
	puts "Entre com a letra ou palavra"
	chute = gets.strip
	puts "Será que acertou? Você chutou #{chute}"
	chute
end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quer_jogar = quero_jogar.upcase == "N"
end

def sorteia_palavra_secreta
	puts "Escolhendo uma palavra..."
	palavra_secreta = "programador"
	puts "Escolhida uma palavra com #{palavra_secreta.size} letras... boa sorte!"
	palavra_secreta
end

def avisa_chute_repetido(chute)
    puts "Você já chutou #{chute}"
end

def avisa_letra_nao_encontrada
    puts "Letra não encontrada!"
end

def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes!"
end

def avisa_acertou_palavra
    puts "Parabéns! Acertou!"
end

def avisa_errou_palavra
    puts "Que pena... errou!"
end

def avisa_pontos(pontos_ate_agora)
    puts "Você ganhou #{pontos_ate_agora} pontos."
end

def cabecalho_de_tentativa(chutes, erros)
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
end