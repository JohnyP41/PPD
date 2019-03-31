--zad 1
module Mojzbior where
podzbior :: Eq a => [a] -> [a] -> Bool
podzbior [] y = True
podzbior (x:xs) y | elem x y == True = podzbior xs y
                  | otherwise = False
iloczyn :: Eq a => [a] -> [a] -> [a]
iloczyn [] y = []
iloczyn (x:xs) y | elem x y == True = [x] ++ iloczyn xs y
                 | otherwise = iloczyn xs y
suma :: Eq a => [a] -> [a] -> [a]
suma [] y = y
suma (x:xs) y | elem x y == True = suma xs y
              | otherwise = [x] ++ suma xs y
roznica :: Eq a => [a] -> [a] -> [a]
roznica [] y = []
roznica (x:xs) y | elem x y == True = roznica xs y
                 | otherwise = [x] ++ roznica xs y