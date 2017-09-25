local tabuleiro = {{}, {}, {}}

function tabuleiro:novo()
	local x = {}
	setmetatable(x, {__index = tabuleiro})
	self:vazio()
	return x
end

function tabuleiro:vazio()
	for i=1,3 do
		for j=1,3 do
			self[i][j] = " "
		end
	end
end

function tabuleiro:acabou()
	for k,v in pairs(self) do
		for i=1,3 do
			if (self[k][i] == " ") then
				return false
			end
		end
	end
	return true
end

function tabuleiro:vencedor()
	for i=1,3 do
		
		local linha = ((self[i][1] == self[i][2]) and (self[i][3] == self[i][1])) and (self[i][2] ~= " ")
		local coluna = ((self[1][i] == self[2][i]) and (self[3][i] == self[2][i])) and (self[2][i] ~= " ")
		
		if (linha) then
			
			self[i][1] = "-"
			self[i][2] = "-"
			self[i][3] = "-"
			
			return true
		end

		if (coluna) then
			
			self[1][i] = " | "
			self[2][i] = " | "
			self[3][i] = " | "
			
			return true
		end

	end

	local diagonal1 = ((self[1][1] == self[2][2]) and (self[3][3] == self[2][2])) and (self[2][2] ~= " ")
	local diagonal2 = ((self[1][3] == self[2][2]) and (self[3][1] == self[2][2])) and (self[2][2] ~= " ")

		if (diagonal1) then
			self[1][1] = "\\"
			self[2][2] = "\\"
			self[3][3] = "\\"
			return true
		end

		if (diagonal2) then
			self[1][3] = "/"
			self[2][2] = "/"
			self[3][1] = "/"
			return true
		end

	return false

end

function tabuleiro:jogada(linha, coluna, player)

	local jogadaValida = ((linha >= 1 and linha <= 3) and (coluna >= 1 and coluna <=3)) and (self[linha][coluna] == " ")

	if (jogadaValida) then
		self[linha][coluna] = player.caracter
		return true
	else
		return false
	end			

end

function tabuleiro:toString()
    
	print(self[1][1] .. " | " .. self[1][2] .. " | " .. self[1][3])
	print(".........")	
	print(self[2][1] .. " | " .. self[2][2] .. " | " .. self[2][3])
	print(".........")	
	print(self[3][1] .. " | " .. self[3][2] .. " | " .. self[3][3])

end

return tabuleiro