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

function tabuleiro:toString()
    
	print(self[1][1] .. " | " .. self[1][2] .. " | " .. self[1][3])
	print(".........")	
	print(self[2][1] .. " | " .. self[2][2] .. " | " .. self[2][3])
	print(".........")	
	print(self[3][1] .. " | " .. self[3][2] .. " | " .. self[3][3])

end

tabuleiro:novo()
tabuleiro:toString()
print(tabuleiro:acabou())