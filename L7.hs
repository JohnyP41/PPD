import Data.Char
import Data.Function (on)
import Data.List (sortBy)
--zad1
--map (>1) [3,2,1,0,-1] = [True,True,False,False,False]
--map (*2) [3,2,1,0,-1] = [6,4,2,0,-2] 
--zad2
an1 n=if(n==1) then 0 else if(n==2) then 3 else an1(n-1)+5*an1(n-2)

an2 n=if(n==1) then 0 else if(n==2) then 3 else anPOM n 0 3
anPOM n f1 f2=if n==1 then f1 else anPOM (n-1) (f1+f2) (5*f1)
--zad3
swap [] = []
swap [x] = [x]
swap (x:y:xs) = (y:x:xs)

swap1 [] = [] 
swap1 [a] = [a] 
swap1 list = last list:(init(tail list)) ++ [head list]

swap2 [] = [] 
swap2 [a] = [a]
swap2 [x,y] = [x,y]
swap2 [x,y,z] = [x,y,z]
swap2 list = [head list,penultimate list]++(getMiddle list)++[seacond list,last list]
penultimate list = last (take (length list-1) list)
seacond list = head (tail list)
getMiddle list = reverse( tail (tail( reverse (tail (tail list)))))
---do poprawy
--zad4
count :: Eq a => a -> [a] -> Int
count _ [] = 0
count a (x:xs) | a == x = 1 + count a xs
               | otherwise = count a xs

f :: Eq a => [a] -> Bool
f [] = True
f (x:xs) | count x (x:xs) == count (head xs) (x:xs) = f (filter (/=x) xs)
         | otherwise = False 
--zad5
eq :: Eq a => [a] -> [a] -> Bool
eq [] [] = True
eq [] _ = False
eq _ [] = False
eq (x:xs) (y:ys) | x == y = eq xs ys
                 | otherwise = False
--zad6
podzbior :: Eq a => [a] -> [a] -> Bool
podzbior [] y = True
podzbior (x:xs) y | elem x y == True = podzbior xs y
                  | otherwise = False

rowne :: Eq a => [a] -> [a] -> Bool
rowne a b=if(podzbior a b == True && podzbior b a == True) then True else False
--zad7
-- Zad. 7 a) sortowanie przez wstawianie
mnm :: Ord a => [a] -> a
mnm [] = error "empty list"
mnm [x] = x
mnm (x:xs) = min x (mnm xs)

removeFst :: Eq a => a-> [a] -> [a]
removeFst x [] = []
removeFst x (y:ys) | x == y = ys
                   | otherwise = y : (removeFst x ys)

sort [] = []
sort xs = m : (sort (removeFst m xs)) where m = mnm xs
-- Zad. 7 b) sortowanie bąbelkowe
bubblesort :: Ord a => [a] -> [a]
bubblesort s = case bsort s of
               t | t == s    -> t
                 | otherwise -> bubblesort t
               where bsort [x] = [x]
                     bsort (x:xs) | x > head xs = [head xs] ++ bubblesort (x:drop 1 xs)
                                  | otherwise = [x] ++ bubblesort xs
--zad8
con :: Ord a => [a] -> [a] -> [a]
con x [] = x
con [] y = y
con (x:xs) (y:ys) | x <= y = con xs (x:y:ys)
                  | otherwise = con xs (ins x (y:ys))
                              where ins :: Ord a => a -> [a] -> [a]
                                    ins a [] = [a]
                                    ins a (b:bs) | a <= b = (a:b:bs)
                                                 | otherwise = (b: ins a bs)
--zad9
--Brak instancji dla (Eq a) wynikającej z użycia `== '
pusta1 :: Eq a => [a] -> Bool
pusta1 x =if(x==[]) then True else False
--zad10
--Nie można dopasować typu „Char” do „Int” 
--Oczekiwany typ: String -> Int 
--Rzeczywisty typ: [Int] -> Char
--naInt :: String -> Int 
--naInt = foldl(\x acc -> digitToInt (acc) * 10 + digitToInt x) 0
--do poprawy
--zad11
punkty (x1,y1) = ((0-x1)^2+(0-y1)^2)**0.5

f1 x=sortBy (compare `on` punkty) x
