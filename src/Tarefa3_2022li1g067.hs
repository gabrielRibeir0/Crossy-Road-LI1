{- |
Module      : Tarefa3_2022li1g067
Description : Movimentação do personagem e obstáculos
Copyright   : José Luís Matos Ribeiro  <a105108@alunos.uminho.pt>
              Gabriel Pereira Ribeiro  <a104171@alunos.uminho.pt>

Módulo para a realização da Tarefa 3 do projeto de LI1 em 2022/23.
-}
module Tarefa3_2022li1g067 where
import LI12223
-- * Função principal

{- |A função 'animaJogo' é a principal deste módulo e responsável por devolver o mapa depois de aplicada a movimentação do jogador e dos obstáculos.

A função é definida da seguinte forma:

@
animaJogo (Jogo (Jogador (x,y)) (Mapa l ll)) j = Jogo (Jogador (newPos)) (Mapa l (moveObstaculos ll (maxCasas (ll !! snd(newPos)) newPos) ))
    where newPos = moveJogador (x,y) l ll j
@

A função principal recorre a outras três funções para processar a movimentação do jogador e dos obstáculos, 'moveJogador' e 'moveObstaculos' e 'maxCasas', respetivamente.

-}
animaJogo :: Jogo -> Jogada -> Jogo
animaJogo (Jogo (Jogador (x,y)) (Mapa l ll)) j = Jogo (Jogador (newPos)) (Mapa l (moveObstaculos ll (maxCasas (ll !! snd(newPos)) newPos) ))
    where newPos = moveJogador (x,y) l ll j
-- * Funções auxiliares

{- |
A função 'moveJogador' altera a posição do jogador tendo em conta a jogada realizada.

@
moveJogador (x,y) l ll (Move Cima) | snd(ll !! y) !! x == Tronco = if y < 1 || snd(ll !! (y-1)) !! x == Arvore then posJogador 0 (x,y) (ll !! y) else (x,y-1)
                                   | otherwise = if y < 1 || snd(ll !! (y-1)) !! x == Arvore then (x,y) else (x, y-1)
moveJogador (x,y) l ll (Move Baixo) | snd(ll !! y) !! x == Tronco = if y+1 >= length ll || snd(ll !! (y+1)) !! x == Arvore then posJogador 0 (x,y) (ll !! y) else (x,y+1)
                                    | otherwise = if y+1 >= length ll || snd(ll !! (y+1)) !! x == Arvore then (x,y) else (x, y+1)
moveJogador (x,y) l ll (Move Esquerda) | not (x < 1) && snd(ll !! y) !! (x-1) == Tronco = posJogador (-1) (x,y) (ll !! y)
                                       | otherwise = if x < 1 || snd(ll !! y) !! (x-1) == Arvore then (x, y) else (x-1, y)
moveJogador (x,y) l ll (Move Direita) | not (x+1 >= l) && snd(ll !! y) !! (x+1) == Tronco = posJogador 1 (x,y) (ll !! y)
                                      | otherwise = if x+1 >= l || snd(ll !! y) !! (x+1) == Arvore then (x, y) else (x+1, y)
moveJogador (x,y) _ ll Parado | snd(ll !! y) !! x == Tronco = posJogador 0 (x,y) (ll !! y)
                              | otherwise = (x,y)
@

Tem em atenção ainda o facto de o jogador não poder sair do mapa com a sua jogada, não poder estar no mesmo sítio que uma árvore e que, caso fique parado em cima de um tronco, se movimente com ele.
-}
moveJogador :: Coordenadas -> Largura -> [(Terreno,[Obstaculo])] -> Jogada -> Coordenadas
moveJogador (x,y) l ll (Move Cima) | snd(ll !! y) !! x == Tronco = if y < 1 || snd(ll !! (y-1)) !! x == Arvore then posJogador 0 (x,y) (ll !! y) else (x,y-1)
                                   | otherwise = if y < 1 || snd(ll !! (y-1)) !! x == Arvore then (x,y) else (x, y-1)
moveJogador (x,y) l ll (Move Baixo) | snd(ll !! y) !! x == Tronco = if y+1 >= length ll || snd(ll !! (y+1)) !! x == Arvore then posJogador 0 (x,y) (ll !! y) else (x,y+1)
                                    | otherwise = if y+1 >= length ll || snd(ll !! (y+1)) !! x == Arvore then (x,y) else (x, y+1)
moveJogador (x,y) l ll (Move Esquerda) | not (x < 1) && snd(ll !! y) !! (x-1) == Tronco = posJogador (-1) (x,y) (ll !! y)
                                       | otherwise = if x < 1 || snd(ll !! y) !! (x-1) == Arvore then (x, y) else (x-1, y)
moveJogador (x,y) l ll (Move Direita) | not (x+1 >= l) && snd(ll !! y) !! (x+1) == Tronco = posJogador 1 (x,y) (ll !! y)
                                      | otherwise = if x+1 >= l || snd(ll !! y) !! (x+1) == Arvore then (x, y) else (x+1, y)
moveJogador (x,y) _ ll Parado | snd(ll !! y) !! x == Tronco = posJogador 0 (x,y) (ll !! y)
                              | otherwise = (x,y)

{- |A função 'posJogador' auxilia no cálculo da posição do jogador quando esta é influenciada pela velocidade do tronco onde está.

@
posJogador 0 (x,y) (Rio v,_) = (x+v,y)
posJogador m (x,y) (Rio v,_) = (x+v+m,y)
@

Como produz resultados diferentes em 2 situações distintas, recebe um /__Int__/ para identificar de que caso se trata e qual valor retornar.
-}
posJogador :: Int -> Coordenadas -> (Terreno, [Obstaculo]) -> Coordenadas
posJogador 0 (x,y) (Rio v,_) = (x+v,y)
posJogador m (x,y) (Rio v,_) = (x+v+m,y)

{- |A função 'maxCasas' calcula o número máximo de casas que os obstáculos se movimentam até ser, se for o caso, detetado um atropelamento.

@
maxCasas (Estrada 0, _) _ = 0
maxCasas (Estrada v, os) (x,y) | os !! x == Carro = 0
                               | otherwise = if v > 0 then 1 + maxCasas (Estrada (v-1), last os : init os) (x,y) 
                                             else 1 + maxCasas (Estrada (v+1), tail os ++ [head os]) (x,y)
maxCasas _ _ = 100
@

Caso haja um atropelamento na Estrada onde o jogador está a função retorna o valor máximo de casas para os obstáculos se moverem, caso contrário, retorna um número suficientemente grande para que os osbstáculos de desloquem o número de casas normal.
-}
maxCasas :: (Terreno,[Obstaculo]) -> Coordenadas -> Int
maxCasas (Estrada 0, _) _ = 100
maxCasas (Estrada v, os) (x,y) | os !! x == Carro = 0
                               | otherwise = if v > 0 then 1 + maxCasas (Estrada (v-1), last os : init os) (x,y) 
                                             else 1 + maxCasas (Estrada (v+1), tail os ++ [head os]) (x,y)
maxCasas _ _ = 100

{- |
Esta função 'moveObstaculos' é responsável por alterar a posição dos obstáculos que se mexem no mapa.

@
moveObstaculos [] _ = [] 
moveObstaculos ((Relva, os):ts) max = (Relva,os) : moveObstaculos ts max
moveObstaculos ((Rio v, os):ts) max | v > max && v > 0 = (Rio v, moveDireita os max) : moveObstaculos ts max 
                                    | v <= max && v >= 0 = (Rio v, moveDireita os v) : moveObstaculos ts max 
                                    | abs v > max && v < 0 = (Rio v, moveEsquerda os max) : moveObstaculos ts max 
                                    | abs v <= max && v <= 0 = (Rio v, moveEsquerda os (abs v)) : moveObstaculos ts max
moveObstaculos ((Estrada v, os):ts) max | v > max && v > 0 = (Estrada v, moveDireita os max) : moveObstaculos ts max 
                                        | v <= max && v >= 0 = (Estrada v, moveDireita os v) : moveObstaculos ts max 
                                        | abs v > max && v < 0 = (Estrada v, moveEsquerda os max) : moveObstaculos ts max 
                                        | abs v <= max && v <= 0 = (Estrada v, moveEsquerda os (abs v)) : moveObstaculos ts max
@

Tem em conta o sentido da movimentação recorrendo para isso a duas funções auxiliares: 
-}
moveObstaculos :: [(Terreno,[Obstaculo])] -> Int -> [(Terreno,[Obstaculo])] 
moveObstaculos [] _ = [] 
moveObstaculos ((Relva, os):ts) max = (Relva,os) : moveObstaculos ts max
moveObstaculos ((Rio v, os):ts) max | v > max && v > 0 = (Rio v, moveDireita os max) : moveObstaculos ts max 
                                    | v <= max && v >= 0 = (Rio v, moveDireita os v) : moveObstaculos ts max 
                                    | abs v > max && v < 0 = (Rio v, moveEsquerda os max) : moveObstaculos ts max 
                                    | abs v <= max && v <= 0 = (Rio v, moveEsquerda os (abs v)) : moveObstaculos ts max
moveObstaculos ((Estrada v, os):ts) max | v > max && v > 0 = (Estrada v, moveDireita os max) : moveObstaculos ts max 
                                        | v <= max && v >= 0 = (Estrada v, moveDireita os v) : moveObstaculos ts max 
                                        | abs v > max && v < 0 = (Estrada v, moveEsquerda os max) : moveObstaculos ts max 
                                        | abs v <= max && v <= 0 = (Estrada v, moveEsquerda os (abs v)) : moveObstaculos ts max

{- |
A função 'moveDireita' que é chamada caso a velocidade naquele terreno seja positiva e que movimenta os obstáculos /__v__/ posições para a direita, criando um túnel nas bordas laterais do mapa.

@
moveDireita :: [Obstaculo] -> Int -> [Obstaculo]
moveDireita l 0 = l
moveDireita l n = moveDireita (last l : init l) (n -1)
@

-}
moveDireita :: [Obstaculo] -> Int -> [Obstaculo]
moveDireita l 0 = l
moveDireita l n = moveDireita (last l : init l) (n -1)
{- |
A função 'moveEsquerda' que funciona de maneira semelhante à 'moveDireita', mas para os casos em que a velocidade é negativa, movendo os obstáculos /__|v|__/ posições para a esquerda.

@
moveEsquerda :: [Obstaculo] -> Int -> [Obstaculo]
moveEsquerda l 0 = l
moveEsquerda l n = moveEsquerda (tail l ++ [head l] ) (n - 1)
@
-}
moveEsquerda :: [Obstaculo] -> Int -> [Obstaculo]
moveEsquerda l 0 = l
moveEsquerda l n = moveEsquerda (tail l ++ [head l] ) (n - 1)