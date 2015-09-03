# coding: utf-8

def da_boas_vindas
	puts "Bem vindo ao jogo da adivinhação"
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n"
	puts "Começamos o jogo para você, #{nome}"
	nome
end

def pede_dificuldade
	puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
	gets.to_i
end

def sorteia_numero_secreto(dificuldade)
	case dificuldade
		when 1
			maximo = 30
		when 2
			maximo = 60
		when 3
			maximo = 100
		when 4
			maximo = 150
		when 5
			maximo = 200
	end
	puts "Escolhendo um númeo entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1
	puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
	sorteado
end

def pede_numero(tentativa, limite_tentativa)
	puts "\n\n"
	puts "Tentativa #{tentativa} de #{limite_tentativa}"
	puts "Entre com um número"
	chute = gets
	puts "Será que acertou? Você chutou #{chute}"
	chute
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = numero_secreto == chute.to_i
	
	if acertou
		puts "Acertou!"
		return true
	end
	maior = numero_secreto > chute.to_i
	if maior
		puts "O número secreto é maior!"
	else
		puts "O número secreto é menor!"
	end
	false
end

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade
	limite_tentativa = 5
	chutes = []
	pontos_ate_agora = 1000

	for tentativa in 1..limite_tentativa
		chute = pede_numero tentativa, limite_tentativa
		chutes << chute

		if nome == "iza"
			puts "Acertou!"
			break
		end

		pontos_a_perder = (chute - numero_secreto).abs / 2.0
		pontos_ate_agora = pontos_ate_agora - pontos_a_perder

		if verifica_se_acertou numero_secreto, chute
			break
		end
	end

	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quero_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	break if nao_quero_jogar?
end
