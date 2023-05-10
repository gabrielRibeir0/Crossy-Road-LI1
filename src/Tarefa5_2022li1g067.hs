{- |
Module      : Tarefa5_2022li1g067
Description : Deslize do Jogo
Copyright   : José Luís Matos Ribeiro  <a105108@alunos.uminho.pt>
              Gabriel Pereira Ribeiro  <a104171@alunos.uminho.pt>

Módulo para a realização da Tarefa 5 do projeto de LI1 em 2022/23.
-}
module Tarefa5_2022li1g067 where

import LI12223
import Tarefa2_2022li1g067

{- | A função 'deslizaJogo' atualiza o mapa e a posição do jogo à medida que o tempo passa, criando a impressão de desliza do mapa.

@
deslizaJogo i (Jogo(Jogador (x,y)) (Mapa l ll)) = Jogo (Jogador (x,y+1)) (estendeMapa (Mapa l (init ll)) i)
@

Uma nova linha é gerada no topo do mapa, recorrendo à função 'estendeMapa' da Tarefa 2, enquanto a última desaparece. Consequentemente, o jogador também vai 1 coordenada para baixo.
-}
deslizaJogo :: Int -> Jogo -> Jogo
deslizaJogo i (Jogo(Jogador (x,y)) (Mapa l ll)) = Jogo (Jogador (x,y+1)) (estendeMapa (Mapa l (init ll)) i)