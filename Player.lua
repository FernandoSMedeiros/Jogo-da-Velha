local player = {caracter = " "}

function player:novo(caracter)
	local player = {}
	setmetatable(player, {__index = player} )
	player.caracter = caracter

	return player	
end

return player