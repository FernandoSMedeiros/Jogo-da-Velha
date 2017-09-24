local tabuleiro = require("Tabuleiro")
local player = require("Player")

local jogo = {player1, player2, tabuleiro, jogadorAtual}

function jogo:novo()
	
	local novo = {}
	setmetatable(novo, {__index = jogo})
	novo.player1 = player:novo('O')
	novo.player2 = player:novo('X')
	novo.jogadorAtual = player:novo('O')

	return novo
end

function jogo:vez()
	if (self.player.simbolo == self.jogadorAtual.simbolo) then
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

	end
end