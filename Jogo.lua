local tabuleiro = require("Tabuleiro")
local player = require("Player")

local jogo = {player1, player2, tabuleiro, jogadorAtual}

function jogo:novo()
	
	local novo = {}
	setmetatable(novo, {__index = jogo})
	novo.tabuleiro = tabuleiro:novo()
	novo.player1 = player:novo("O")
	novo.player2 = player:novo("X")
	novo.jogadorAtual = player:novo("O")

	return novo
end

function jogo:vez()
	if (self.player1.caracter == self.jogadorAtual.caracter) then
		self.jogadorAtual = self.player2
	else
		self.jogadorAtual = self.player1
	end
end

function jogo:iniciar()
	while 1 do

		print("Vez de: " .. self.jogadorAtual.caracter)
		print("Linha")
		local linha = io.read("*number")
		print("Coluna")
		local coluna = io.read("*number")
		print()
		if self.tabuleiro:jogada(linha, coluna, self.jogadorAtual) then
			print(self.tabuleiro:toString())
			print()
			if self.tabuleiro:vencedor() == true then
				print(self.jogadorAtual.caracter .. " Ganhou")
				print()
				print(self.tabuleiro:toString())
				break
	      	elseif self.tabuleiro:acabou() == true and self.tabuleiro:vencedor() ~= false then
				print("Empate")
				print()
				print(self.tabuleiro:toString())
				break
			else
				self:vez()
			end
		else
			print("A posição digitada não é válida")
		end

	end
end

return jogo