{- |
Module      : Tarefa2_2022li1g067
Description : Geração contínua de um mapa
Copyright   : José Luís Matos Ribeiro  <a105108@alunos.uminho.pt>
              Gabriel Pereira Ribeiro  <a104171@alunos.uminho.pt>

Módulo para a realização da Tarefa 2 do projeto de LI1 em 2022/23.
-}
module Tarefa2_2022li1g067 where

import LI12223
import Tarefa1_2022li1g067 (obsV2, validaPassagemEntreArvores)

-- * Função principal

{- |A função principal, 'estendeMapa' acrescenta uma linha nova no topo do mapa dado.

@
estendeMapa :: Mapa -> Int -> Mapa
estendeMapa (Mapa l ll) n
    | obsV2 (velocidadeAleatoria n terreno t) (listaObstaculo n l terreno) && validaPassagemEntreArvores (velocidadeAleatoria n terreno t, listaObstaculo n l terreno) ll = Mapa l ((velocidadeAleatoria n terreno t, listaObstaculo n l terreno): ll)
    | otherwise = estendeMapa (Mapa l ll) (n+1)
    where terreno | null ll = Relva
                  | otherwise =  escolheTerreno n (proximosTerrenosValidos (Mapa l ll))
          t | null ll = Relva
            | otherwise = fst(head ll)
@

Para respeitar as restrições impostas para ser um mapa válido, esta função recorre à função da Tarefa 1 'mapaValido' tem algumas funções auxiliares.
-}
estendeMapa :: Mapa -> Int -> Mapa
estendeMapa (Mapa l ll) n
    | obsV2 (velocidadeAleatoria n terreno t) (listaObstaculo n l terreno) && validaPassagemEntreArvores (velocidadeAleatoria n terreno t, listaObstaculo n l terreno) ll = Mapa l ((velocidadeAleatoria n terreno t, listaObstaculo n l terreno): ll)
    | otherwise = estendeMapa (Mapa l ll) (n+1)
    where terreno | null ll = Relva
                  | otherwise =  escolheTerreno n (proximosTerrenosValidos (Mapa l ll))
          t | null ll = Relva
            | otherwise = fst(head ll)

-- * Funções auxiliares

{- |A função 'proximosTerrenosValidos' que indica os terrenos que é possível escolher tendo em conta o resto do mapa.

@
proximosTerrenosValidos (Mapa _ []) = [Relva]
proximosTerrenosValidos (Mapa _ ((Rio _, _):(Rio _, _):(Rio _, _):(Rio _, _):t)) = [Estrada 0, Relva]
proximosTerrenosValidos (Mapa _ ((Relva,_):(Relva,_):(Relva,_):(Relva,_):(Relva,_):t)) = [Rio 0, Estrada 0]
proximosTerrenosValidos (Mapa _ ((Estrada _, _):(Estrada _, _):(Estrada _, _):(Estrada _, _):(Estrada _,_):t)) = [Relva, Rio 0]
proximosTerrenosValidos (Mapa _ _) = [Relva, Rio 0, Estrada 0]
@
-}
proximosTerrenosValidos :: Mapa -> [Terreno]
proximosTerrenosValidos (Mapa _ ((Rio _, _):(Rio _, _):(Rio _, _):(Rio _, _):t)) = [Estrada 0, Relva]
proximosTerrenosValidos (Mapa _ ((Relva,_):(Relva,_):(Relva,_):(Relva,_):(Relva,_):t)) = [Rio 0, Estrada 0]
proximosTerrenosValidos (Mapa _ ((Estrada _, _):(Estrada _, _):(Estrada _, _):(Estrada _, _):(Estrada _,_):t)) = [Relva, Rio 0]
proximosTerrenosValidos (Mapa _ _) = [Relva, Rio 0, Estrada 0]

{- |'escolheTerreno' para escolher um terreno da lista de terrenos válidos.

@
escolheTerreno n (h:t) | mod n 3 == 0 = h
                       | mod n 3 == 1 = head t
                       | otherwise = last t
@

Recorre ao resultado de /__mod n 3__/ para ter alguma pseudo-aleatoriedade na escolha do mapa.
-}
escolheTerreno :: Int -> [Terreno] -> Terreno
escolheTerreno n (h:t) | mod n 3 == 0 = h
                       | mod n 3 == 1 = head t
                       | otherwise = last t

{- |'velocidadeAleatoria' para atribuir uma velocidade ao terreno escolhido.

@
velocidadeAleatoria _ Relva _ = Relva
velocidadeAleatoria n (Rio v) (Rio v0) | v0 > 0 = if even n then Rio (-1) else Rio (-2)
                                       | otherwise =  if even n then Rio 1 else Rio 2
velocidadeAleatoria n (Estrada v) (Estrada v0) | v0 > 0 = if even n then Estrada (-1) else Estrada (-2)
                                               | otherwise =  if even n then Estrada 1 else Estrada 2
velocidadeAleatoria n (Rio v) _ | mod n 4 == 0 = Rio 1
                                | mod n 4 == 1 = Rio (-1)
                                | mod n 4 == 2 = Rio 2
                                | otherwise = Rio (-2)
velocidadeAleatoria n (Estrada v) _ | mod n 4 == 0 = Estrada 1
                                    | mod n 4 == 1 = Estrada (-1)
                                    | mod n 4 == 2 = Estrada 2
                                    | otherwise = Estrada (-2)
@

Também acrescenta alguma aleatoriedade com o resultado da expressão /__mod n 4__/.
-}
velocidadeAleatoria :: Int -> Terreno -> Terreno -> Terreno
velocidadeAleatoria _ Relva _ = Relva
velocidadeAleatoria n (Rio v) (Rio v0) | v0 > 0 = if even n then Rio (-1) else Rio (-2)
                                       | otherwise =  if even n then Rio 1 else Rio 2
velocidadeAleatoria n (Rio v) _ | mod n 4 == 0 = Rio 1
                                | mod n 4 == 1 = Rio (-1)
                                | mod n 4 == 2 = Rio 2
                                | otherwise = Rio (-2)
velocidadeAleatoria n (Estrada v) _ | mod n 4 == 0 = Estrada 1
                                    | mod n 4 == 1 = Estrada (-1)
                                    | mod n 4 == 2 = Estrada 2
                                    | otherwise = Estrada (-2)

{- |A função 'proximosObstaculosValidos' para devolver a lista de obstáculos válidos, tendo em conta as restrições de tamanho de objetos e tipo de terreno.

@
proximosObstaculosValidos l (Rio _, []) = [Nenhum,Tronco]
proximosObstaculosValidos l (Estrada _, []) = [Nenhum,Carro]
proximosObstaculosValidos l (Relva , os) | length os >= l = [] 
                                         | otherwise = if elem Nenhum os then [Nenhum, Arvore] else [Nenhum]
proximosObstaculosValidos l (Rio _, os) | length os >= l = []
                                        | length os > 4 = if elem Nenhum (take 5 os) then [Nenhum,Tronco] else [Nenhum]
                                        | otherwise = if elem Nenhum os && not(elem Tronco os) then [Tronco] else if elem Nenhum os then [Nenhum,Tronco] else [Nenhum] 
proximosObstaculosValidos l (Estrada  _, os) | length os >= l = []
                                             | length os > 2 = if elem Nenhum (take 3 os) then [Nenhum,Carro] else [Nenhum]
                                             | otherwise = if elem Nenhum os then [Nenhum, Carro] else [Nenhum]
@
-}
proximosObstaculosValidos :: Int -> (Terreno, [Obstaculo]) -> [Obstaculo]
proximosObstaculosValidos l (Rio _, []) = [Nenhum,Tronco]
proximosObstaculosValidos l (Estrada _, []) = [Nenhum,Carro]
proximosObstaculosValidos l (Relva , os) | length os >= l = [] 
                                         | otherwise = if elem Nenhum os then [Nenhum, Arvore] else [Nenhum]
proximosObstaculosValidos l (Rio _, os) | length os >= l = []
                                        | length os > 4 = if elem Nenhum (take 5 os) then [Nenhum,Tronco] else [Nenhum]
                                        | otherwise = if elem Nenhum os && not(elem Tronco os) then [Tronco] else if elem Nenhum os then [Nenhum,Tronco] else [Nenhum] 
proximosObstaculosValidos l (Estrada  _, os) | length os >= l = []
                                             | length os > 2 = if elem Nenhum (take 3 os) then [Nenhum,Carro] else [Nenhum]
                                             | otherwise = if elem Nenhum os then [Nenhum, Carro] else [Nenhum]

{- |'escolheObstaculo' para escolher um obstáculo, com alguma aleatoriedade (se o número n, aleatório, for par ou ímpar)

@
escolheObstaculo n l (t,os) | even n = head obsv
                            | otherwise = last obsv
    where obsv = proximosObstaculosValidos l (t,os)
@
-}
escolheObstaculo :: Int -> Largura -> (Terreno, [Obstaculo]) -> Obstaculo
escolheObstaculo n l (t,os) | even n = head obsv
                            | otherwise = last obsv
    where obsv = proximosObstaculosValidos l (t,os)

{- |'listaObstaculo' para criar a lista de obstáculos válidos até atingir a largura do mapa.

@
listaObstaculo n 0 t = []
listaObstaculo n l t = escolheObstaculo n l (t,o) : o
    where o = listaObstaculo n (l-1) t
@
-}
listaObstaculo :: Int -> Largura -> Terreno -> [Obstaculo]
listaObstaculo n 0 t = []
listaObstaculo n l t = escolheObstaculo n l (t,o) : o
    where o = listaObstaculo (n + (mod n 5)) (l-1) t