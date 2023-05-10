module Tarefa1_2022li1g067_Spec where

import LI12223
import Tarefa1_2022li1g067
import Test.HUnit


test1:: Test
test1 = True ~=? mapaValido (Mapa 8 [(Relva, [Nenhum, Arvore, Nenhum, Nenhum, Arvore, Nenhum, Nenhum, Arvore])
            ,(Relva, [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Nenhum, Nenhum, Nenhum, Carro, Carro, Carro])
            ,(Estrada (-1), [Nenhum, Nenhum, Nenhum, Carro, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Relva, [Arvore, Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Arvore])
            ,(Relva, [Arvore, Nenhum, Arvore, Nenhum, Nenhum, Nenhum, Arvore, Arvore])
            ,(Rio 2, [Tronco, Tronco, Nenhum, Tronco, Tronco, Nenhum, Nenhum, Nenhum])
            ,(Rio (-1), [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco, Tronco, Tronco])
            ,(Rio 1, [Tronco, Nenhum, Nenhum, Tronco, Nenhum, Nenhum, Tronco, Tronco])
            ])
--Falso pois não é permitido um carro de largura 4 e exemplificamos que se tiver carros ou troncos nas margens eles fazem parte do mesmo
test2:: Test
test2 = False ~=? mapaValido (Mapa 8 [(Relva, [Nenhum, Arvore, Nenhum, Nenhum, Arvore, Nenhum, Nenhum, Arvore])
            ,(Relva, [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada (-1), [Carro, Nenhum, Nenhum, Nenhum, Nenhum, Carro, Carro, Carro])
            ,(Estrada 1, [Nenhum, Nenhum, Nenhum, Carro, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Relva, [Arvore, Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Arvore])
            ,(Relva, [Arvore, Nenhum, Arvore, Nenhum, Nenhum, Nenhum, Arvore, Arvore])
            ,(Rio 2, [Tronco, Tronco, Nenhum, Tronco, Tronco, Nenhum, Nenhum, Nenhum])
            ,(Rio (-1), [Nenhum, Tronco, Tronco, Nenhum, Nenhum, Tronco, Tronco, Tronco])
            ,(Rio 1, [Tronco, Nenhum, Nenhum, Tronco, Nenhum, Nenhum, Tronco, Tronco])
            ])
--Falso porque rio precisa de pelo menos um tronco, como relva e estrada precisa de pelo menos um nenhum para ser valido
test3::Test
test3 = False ~=? mapaValido (Mapa 8 [(Relva, [Nenhum, Arvore, Nenhum, Nenhum, Arvore, Nenhum, Nenhum, Arvore])
            ,(Rio 1, [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada (-1), [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Carro, Carro, Carro])
            ,(Estrada 1, [Nenhum, Nenhum, Nenhum, Carro, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Relva, [Arvore, Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Arvore])
            ,(Relva, [Arvore, Nenhum, Arvore, Nenhum, Nenhum, Nenhum, Arvore, Arvore])
            ,(Rio 2, [Tronco, Tronco, Nenhum, Tronco, Tronco, Nenhum, Nenhum, Nenhum])
            ,(Rio (-1), [Nenhum, Tronco, Tronco, Nenhum, Nenhum, Tronco, Tronco, Tronco])
            ,(Rio 1, [Tronco, Nenhum, Nenhum, Tronco, Nenhum, Nenhum, Tronco, Tronco])
            ])
--Falso porque a segunda relva tem um numero diferente de tipos de obstaculos e de largura
test4::Test
test4 = False ~=? mapaValido (Mapa 8 [(Relva, [Nenhum, Arvore, Nenhum, Nenhum, Arvore, Nenhum, Nenhum, Arvore])
            ,(Relva, [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada (-1), [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Carro, Carro, Carro])
            ,(Estrada 1, [Nenhum, Nenhum, Nenhum, Carro, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Relva, [Arvore, Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Arvore])
            ,(Relva, [Arvore, Nenhum, Arvore, Nenhum, Nenhum, Nenhum, Arvore, Arvore])
            ,(Rio 2, [Tronco, Tronco, Nenhum, Tronco, Tronco, Nenhum, Nenhum, Nenhum])
            ,(Rio (-1), [Nenhum, Tronco, Tronco, Nenhum, Nenhum, Tronco, Tronco, Tronco])
            ,(Rio 1, [Tronco, Nenhum, Nenhum, Tronco, Nenhum, Nenhum, Tronco, Tronco])
            ])
--Falso porque tem rios seguidos com direções iguais
test5::Test
test5 = False ~=? mapaValido (Mapa 8 [(Relva, [Nenhum, Arvore, Nenhum, Nenhum, Arvore, Nenhum, Nenhum, Arvore])
            ,(Relva, [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada (-1), [Nenhum, Carro, Nenhum, Nenhum, Nenhum, Carro, Carro, Carro])
            ,(Estrada 1, [Nenhum, Nenhum, Nenhum, Carro, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Relva, [Arvore, Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Arvore])
            ,(Relva, [Arvore, Nenhum, Arvore, Nenhum, Nenhum, Nenhum, Arvore, Arvore])
            ,(Rio 2, [Tronco, Tronco, Nenhum, Tronco, Tronco, Nenhum, Nenhum, Nenhum])
            ,(Rio (1), [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco, Tronco, Tronco])
            ,(Rio 1, [Tronco, Nenhum, Nenhum, Tronco, Nenhum, Nenhum, Tronco, Tronco])
            ])
--Falso porque tem um obstaculo num terreno onde não deveria de estar
test6::Test
test6 = False ~=? mapaValido (Mapa 8 [(Relva, [Carro, Arvore, Nenhum, Nenhum, Arvore, Nenhum, Nenhum, Arvore])
            ,(Relva, [Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada 1, [Nenhum, Carro, Carro, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Estrada (-1), [Nenhum, Carro, Nenhum, Nenhum, Nenhum, Carro, Carro, Carro])
            ,(Estrada 1, [Nenhum, Nenhum, Nenhum, Carro, Nenhum, Nenhum, Nenhum, Nenhum])
            ,(Relva, [Arvore, Arvore, Nenhum, Nenhum, Nenhum, Nenhum, Nenhum, Arvore])
            ,(Relva, [Arvore, Nenhum, Arvore, Nenhum, Nenhum, Nenhum, Arvore, Arvore])
            ,(Rio 2, [Tronco, Tronco, Nenhum, Tronco, Tronco, Nenhum, Nenhum, Nenhum])
            ,(Rio (-1), [Nenhum, Tronco, Tronco, Tronco, Nenhum, Tronco, Tronco, Tronco])
            ,(Rio 1, [Tronco, Nenhum, Nenhum, Tronco, Nenhum, Nenhum, Tronco, Tronco])
            ])
--Falso porque tem Relva com tudo arvores
test7::Test
test7 = False ~=? mapaValido (Mapa 8 [(Relva, [Arvore,Arvore,Arvore,Arvore,Arvore,Arvore,Arvore,Arvore])
            ,(Relva,[Arvore,Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Nenhum,Arvore])
            ,(Relva,[Arvore,Arvore,Nenhum,Arvore,Arvore,Arvore,Arvore,Arvore])
            ,(Relva,[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum])
            ,(Relva,[Arvore,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum])
            ])
--Falso pois tem 6 relva seguidos sendo que o maximo é 5
test8::Test
test8 = False ~=? mapaValido (Mapa 8 [(Relva, [Nenhum,Arvore,Arvore,Arvore,Arvore,Arvore,Arvore,Arvore])
            ,(Relva,[Arvore,Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Nenhum,Arvore])
            ,(Relva,[Arvore,Arvore,Nenhum,Arvore,Arvore,Arvore,Arvore,Arvore])
            ,(Relva,[Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum])
            ,(Relva,[Arvore,Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum])
            ,(Relva,[Arvore,Nenhum,Nenhum,Arvore,Nenhum,Nenhum,Nenhum,Nenhum])
            ])
testsT1::Test
testsT1 = TestList [
     "Teste 1" ~: test1,
     "Teste 2" ~: test2,
     "Teste 3" ~: test3,
     "Teste 4" ~: test4,
     "Teste 5" ~: test5,
     "Teste 6" ~: test6,
     "Teste 7" ~: test7,
     "Teste 8" ~: test8
     ]