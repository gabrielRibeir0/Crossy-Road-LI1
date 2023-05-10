{- |
Module      : Tarefa4_2022li1g067
Description : Determinar se o jogo terminou
Copyright   : José Luís Matos Ribeiro  <a105108@alunos.uminho.pt>
              Gabriel Pereira Ribeiro  <a104171@alunos.uminho.pt>

Módulo para a realização da Tarefa 4 do projeto de LI1 em 2022/23.
-}
module Tarefa4_2022li1g067 where

import LI12223
-- * Função principal

{- |A função 'jogoTerminou' é a principal deste módulo e responsável por verificar se o jogo terminou e o jogador perdeu.

A função é definida da seguinte forma:

@
jogoTerminou (Jogo (Jogador (x,y)) (Mapa l ll)) = x < 0 || x >= l || y < 0 || y >= length ll || caiuNaAgua (x,y) (ll !! y) || debaixoCarro (x,y) (ll !! y)
@

O jogo termina se se verificar pelo menos uma das seguintes condições:

* o jogador saiu do mapa;

* o jogador caiu na água;

* o jogador foi atingido por um carro.

Para verificar se o jogador saiu do mapa compara-se as suas coordenadas com as dimensões do mapa na função principal.

As duas últimas condições são verificadas com recurso a 2 funções auxiliares, 'caiuNaAgua' e 'debaixoCarro'.
-}
jogoTerminou :: Jogo -> Bool
jogoTerminou (Jogo (Jogador (x,y)) (Mapa l ll)) = x < 0 || x >= l || y < 0 || y >= length ll || caiuNaAgua (x,y) (ll !! y) || debaixoCarro (x,y) (ll !! y)

-- * Funções auxiliares

{- |A função 'caiuNaAgua' retorna /__False__/ caso o jogador não esteja num rio, ou se está em cima de um tronco ou /__True__/ se estiver num rio em um sítio sem obstáculos.

@
caiuNaAgua (x,y) (Rio v, os) | os !! x == Nenhum = True
                             | otherwise = False
caiuNaAgua _ _ = False
@

-}
caiuNaAgua :: Coordenadas -> (Terreno,[Obstaculo]) -> Bool
caiuNaAgua (x,y) (Rio v, os) | os !! x == Nenhum = True
                             | otherwise = False
caiuNaAgua _ _ = False

{- |A função 'debaixoCarro' retorna /__True__/ se na posição do jogador existir um Carro ou /__False__/ caso contrário

@
debaixoCarro (x,y) (Estrada v, os) | os !! x == Carro = True
                                   | otherwise = False
debaixoCarro _ _ = False
@

-}
debaixoCarro :: Coordenadas -> (Terreno,[Obstaculo]) -> Bool
debaixoCarro (x,y) (Estrada v, os) | os !! x == Carro = True
                                   | otherwise = False
debaixoCarro _ _ = False