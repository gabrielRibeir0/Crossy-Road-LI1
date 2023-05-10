module Tarefa3_2022li1g067_Spec where

import LI12223
import Tarefa3_2022li1g067
import Test.HUnit

--move tendo consideração o rio
test1::Test
test1 = (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada 1,[Nenhum,Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio 1,[Nenhum,Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada 1,[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio 1,[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Cima)

test2::Test
test2 = (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Cima)

test3::Test
test3 = (Jogo (Jogador(1,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Esquerda)

test4::Test
test4 = (Jogo (Jogador(2,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Parado)

test5:: Test
test5 = (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Direita)

--segue com rio porque tem uma arvore em frente
test11:: Test
test11 = (Jogo (Jogador(4,2)) (Mapa 8 [(Estrada 1,[Nenhum,Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio 1,[Nenhum,Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Estrada 1,[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Relva,[Nenhum,Nenhum,Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio 1,[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Cima)
--move "normal"
test6:: Test
test6 = (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Parado)

-- pois tem uma arvore em frente então não consegue avançar
test7::Test
test7 = (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Cima)

test8:: Test
test8 = (Jogo (Jogador(4,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Direita)

test9:: Test
test9 = (Jogo (Jogador(2,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Esquerda)

test10:: Test
test10 = (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,1)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Baixo)

-- ver se não sai do mapa com um movimento proprio, e como não pode sair do mapa segue o rio
test12:: Test
test12 = (Jogo (Jogador(2,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Carro]),(Rio (-1),[Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum,Nenhum])])) ~=? animaJogo (Jogo (Jogador(3,2)) (Mapa 8 [(Relva,[Arvore,Nenhum,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum]),(Estrada (-1),[Carro,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]),(Rio (-1),[Nenhum,Nenhum,Tronco,Tronco,Tronco,Tronco,Nenhum,Nenhum])])) (Move Baixo)

testsT3:: Test
testsT3 = TestList [
     "Teste 1" ~: test1,
     "Teste 2" ~: test2,
     "Teste 3" ~: test3,
     "Teste 4" ~: test4,
     "Teste 5" ~: test5,
     "Teste 6" ~: test6,
     "Teste 7" ~: test7,
     "Teste 8" ~: test8,
     "Teste 9" ~: test9,
     "Teste 10" ~: test10,
     "Teste 11" ~: test11,
     "Teste 12" ~: test12
     ]
