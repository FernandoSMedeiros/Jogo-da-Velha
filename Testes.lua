luaunit = require("luaunit")

jogo = require("Jogo")
tabuleiro = require("Tabuleiro")
player = require("Player")

playerI = player:novo()
playerI.caracter = "O"


function testeVezX()
  local jogo = jogo:novo()
  jogo.jogadorAtual.caracter = "X"
  jogo:vez()
  luaunit.assertEquals(jogo.jogadorAtual.caracter, "O")
end

function testeVezO()
  local jogo = jogo:novo()
  jogo.jogadorAtual.caracter = "O"
  jogo:vez()
  luaunit.assertEquals(jogo.jogadorAtual.caracter, "X")
end

function testeVencedorOlinha()
  local player = playerI

  for i=1,3 do
    local tabuleiro = tabuleiro:novo()

    tabuleiro:jogada(i, 1, player)
    tabuleiro:jogada(i, 2, player)
    tabuleiro:jogada(i, 3, player)
    luaunit.assertEquals(tabuleiro:vencedor(), true)

  end

end


function testeVencedorOColuna()
  local player = playerI

  for i=1,3 do
    local tabuleiro = tabuleiro:novo()

    tabuleiro:jogada(1, i, player)
    tabuleiro:jogada(2, i, player)
    tabuleiro:jogada(3, i, player)
    luaunit.assertEquals(tabuleiro:vencedor(), true)

  end

end

function testeVencedorODiagonalEsquerda()
  local player = playerI
  
    local tabuleiro = tabuleiro:novo()

    tabuleiro:jogada(1, 3, player)
    tabuleiro:jogada(2, 2, player)
    tabuleiro:jogada(3, 1, player)
    luaunit.assertEquals(tabuleiro:vencedor(), true)

end

function testeVencedorODiagonalDireita()
  local player = playerI
  
    local tabuleiro = tabuleiro:novo()

    tabuleiro:jogada(1, 1, player)
    tabuleiro:jogada(2, 2, player)
    tabuleiro:jogada(3, 3, player)
    luaunit.assertEquals(tabuleiro:vencedor(), true)
    
end

function testeJogadaValida()
  
  local tabuleiro = tabuleiro:novo()
  
  luaunit.assertEquals(tabuleiro:jogada(1 , 1, playerI), true)
  
end

function testeJogadaInvalidaPosicaoIncorreta()
  
  local tabuleiro = tabuleiro:novo()
  
  luaunit.assertEquals(tabuleiro:jogada(4 , 4, playerI), false)
  
end

function testeJogadaInvalidaPosicaoJaOcupada()
  
  for i=1, 3 do
    for j=1, 3 do
      local tabuleiro = tabuleiro:novo()
      tabuleiro:jogada(i, j, playerI)
      luaunit.assertEquals(tabuleiro:jogada(i , j, playerI), false)
    end
  end
end


function testeNaoAcabou()
  
  local tabuleiro = tabuleiro:novo()
  luaunit.assertEquals(tabuleiro:acabou(), false)
  
end

function testeAcabou()
  
  local tabuleiro = tabuleiro:novo()
    
  for i=1, 3 do
    for j=1, 3 do
        tabuleiro[i][j] = playerI.caracter    
      end
    end
  
  luaunit.assertEquals(tabuleiro:acabou(), true)
  
end

function testeTracoLinha() 
  
  local player = playerI 
  for i=1,3 do
    local tabuleiro = tabuleiro:novo()

    tabuleiro:jogada(i, 1, player)
    tabuleiro:jogada(i, 2, player)
    tabuleiro:jogada(i, 3, player)
    
    tabuleiro:vencedor()
    
    luaunit.assertEquals( (tabuleiro[i][1] == "-") and (tabuleiro[i][2] == "-") and (tabuleiro[i][3] == "-"), true)
    
  end

end  
  

function testeTracoColuna() 
  
  local player = playerI 
  
  for i=1,3 do
    local tabuleiro = tabuleiro:novo()

    tabuleiro:jogada(1, i, player)
    tabuleiro:jogada(2, i, player)
    tabuleiro:jogada(3, i, player)
    
    tabuleiro:vencedor()
    
    luaunit.assertEquals( (tabuleiro[1][i] == " | ") and (tabuleiro[2][i] == " | ") and (tabuleiro[3][i] == " | "), true)
    
  end
  
end

os.exit(luaunit.LuaUnit.run())