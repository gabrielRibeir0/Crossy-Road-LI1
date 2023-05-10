module Tarefa4_2022li1g067_Spec where

import LI12223
import Tarefa5_2022li1g067
import Test.HUnit

testsT5 :: Test
testsT5 = TestLabel "Testes Tarefa 4" $ test ["Teste 1" ~: Jogo (Jogador (1,1)) (Mapa 3 [(Estrada (-1),[Carro,Nenhum,Carro]),(Relva,[Arvore,Nenhum,Arvore]),(Rio 1,[Tronco,Nenhum,Tronco])]) ~=? deslizaJogo 17 (Jogo (Jogador (1,0)) ( Mapa 3 [(Relva,[Arvore,Nenhum,Arvore]),(Rio 1,[Tronco,Nenhum,Tronco]),(Rio 1, [Nenhum,Tronco,Nenhum])])),
    "Teste 2" ~: Jogo (Jogador (4,2)) (Mapa 5 [(Relva,[Nenhum,Nenhum,Nenhum,Arvore,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco]),(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum])]) ~=? deslizaJogo 12 (Jogo (Jogador (4,1)) (Mapa 5 [(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco]),(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum]),(Estrada 1, [Nenhum,Carro,Nenhum,Carro,Carro])])),
    "Teste 3" ~: Jogo (Jogador (3,1)) (Mapa 4 [(Relva,[Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-2),[Nenhum,Nenhum,Tronco,Nenhum]),(Relva,[Nenhum,Nenhum,Arvore,Nenhum])]) ~=? deslizaJogo 42 (Jogo (Jogador (3,0)) (Mapa 4 [(Rio (-2), [Nenhum,Nenhum,Tronco,Nenhum]),(Relva, [Nenhum,Nenhum,Arvore,Nenhum]),(Estrada 2, [Carro,Nenhum,Nenhum,Nenhum])])),
    "Teste 4" ~: Jogo (Jogador (1,2)) (Mapa 5 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum]),(Relva,[Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Nenhum,Arvore,Arvore])]) ~=? deslizaJogo 3 (Jogo (Jogador (1,1)) (Mapa 5 [(Relva,[Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Nenhum,Arvore,Arvore]),(Estrada 1, [Nenhum,Carro,Carro,Nenhum,Carro])])),
    "Teste 5" ~: Jogo (Jogador (1,3)) (Mapa 3 [(Relva,[Arvore,Arvore,Nenhum]),(Estrada 1,[Carro,Nenhum,Carro]),(Relva,[Arvore,Nenhum,Nenhum])]) ~=? deslizaJogo 9 (Jogo (Jogador (1,2)) (Mapa 3 [(Estrada 1,[Carro,Nenhum,Carro]),(Relva,[Arvore,Nenhum,Nenhum]),(Relva, [Arvore,Nenhum,Nenhum])]))]