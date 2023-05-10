module Tarefa4_2022li1g067_Spec where

import LI12223
import Tarefa4_2022li1g067
import Test.HUnit

testsT4 :: Test
testsT4 = TestLabel "Testes Tarefa 4" $ test ["Teste 1" ~: False ~=? jogoTerminou (Jogo (Jogador (1,1)) (Mapa 3 [(Rio 1,[Nenhum,Tronco,Nenhum]),(Relva, [Arvore,Nenhum,Nenhum]),(Relva, [Nenhum,Arvore,Nenhum])]))
    ,"Teste 2" ~: False ~=? jogoTerminou (Jogo (Jogador (1,0)) (Mapa 3 [(Rio 1,[Nenhum,Tronco,Nenhum]),(Relva, [Arvore,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Arvore])]))
    ,"Teste 3" ~: False ~=? jogoTerminou (Jogo (Jogador (2,1)) (Mapa 4 [(Rio 1,[Nenhum,Tronco,Nenhum,Tronco]),(Estrada (-1), [Nenhum,Carro,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Arvore,Arvore])]))
    ,"Teste 4" ~: True ~=? jogoTerminou (Jogo (Jogador (0,3)) (Mapa 3 [(Rio 1,[Nenhum,Tronco,Nenhum]),(Estrada (-1), [Nenhum,Carro,Carro]),(Relva,[Nenhum,Nenhum,Arvore]),(Rio (-2),[Nenhum,Nenhum,Tronco])]))
    ,"Teste 5" ~: True ~=? jogoTerminou (Jogo (Jogador (1,1)) (Mapa 3 [(Relva ,[Nenhum,Nenhum,Nenhum]),(Estrada 2, [Nenhum,Carro,Carro]),(Estrada (-1),[Nenhum,Nenhum,Carro]),(Rio 1,[Nenhum,Nenhum,Tronco])]))
    ,"Teste 6" ~: True ~=? jogoTerminou (Jogo (Jogador (4,0)) (Mapa 4 [(Relva ,[Nenhum,Arvore,Nenhum,Nenhum]),(Rio 1, [Nenhum,Nenhum,Tronco,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Nenhum,Nenhum,Tronco])]))
    ,"Teste 7" ~: True ~=? jogoTerminou (Jogo (Jogador ((-1),0)) (Mapa 3 [(Rio 1,[Nenhum,Tronco,Nenhum]),(Relva, [Arvore,Nenhum,Nenhum]),(Estrada 2,[Carro,Nenhum,Nenhum])]))
    ,"Teste 8" ~: True ~=? jogoTerminou (Jogo (Jogador (2,4)) (Mapa 3 [(Relva ,[Nenhum,Nenhum,Nenhum]),(Estrada 2, [Nenhum,Carro,Carro]),(Estrada (-1),[Nenhum,Nenhum,Carro]),(Rio 1,[Nenhum,Nenhum,Tronco])]))
    ,"Teste 9" ~: True ~=? jogoTerminou (Jogo (Jogador (1,(-1))) (Mapa 4 [(Estrada 1,[Nenhum,Nenhum,Carro,Nenhum]),(Relva, [Arvore,Nenhum,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Arvore,Arvore])]))]