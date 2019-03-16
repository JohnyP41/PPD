--zad 1
powerlists [] = [[]]
powerlists (x:xs) = [x:powerlist | powerlist <- powerlists xs] ++ powerlists xs
--zad2
iloczyn_z [] _ = []
iloczyn_z (x:xs) l | elem x l = x : iloczyn_z xs l
                   | otherwise = iloczyn_z xs l
---zad3
suma_z xs ys = xs ++ suma_z ys xs
    where suma_z [] _         = []
          suma_z (a:as) first = if (a `elem` first) then suma_z as first else a : suma_z as (a:first)
--zad4
--a)(6/(12/(24/(8/2))))
--b)
--(False&&(True&&(True&&True)))
--False&&(True&&True)
--(False&&True)
--False
--c)(max 3 (max 6 (max 12 (max 4 (max 55 (max 11 18))))))
--(max 3 (max 6 (max 12 (max 4 (max 55 18)))))
--(max 3 (max 6 (max 12 (max 4 55))))
--(max 3 (max 6 (max 12 55)))
--(max 3 (max 6 55))
--(max 3 55)
--55
--d)(max 3 (max 6 (max 12 (max 4 (max 55 (max 11 81))))))
--e) 
--f(24 ,f(4, f(10 ,f(6,54))))
--f(24, f(4 ,f(10,30)))
--f(24 ,f(4,20))
--f(24 ,12)
--18
--f)
--f(f(f(f(54,2),4),10),6)
--f(f(f(28,4),10),6)
--f(f(16,10),6)
--f(13,6)
--9.5
--g)(((64/4)/2)/4)
--h)
--f(f(f(8,1),2),3)
--f(f(17,2),3)
--f(36,3)
--75
--zad5
nalezy e xs
    = foldl (||)
            False
            (map (e ==) xs)
--zad6
--a)
map1 f xs = reverse $ foldl (\ys y -> (f y):ys) [] xs
--b)
map2 f = foldr (\x xs -> f x : xs) []
--zad 7
--a)
last1 :: [a] -> a  
last1 = foldl1 (\_ x -> x)
last2 :: [a] -> a  
last2 = foldr1 (\_ x -> x)
--b)
head1 :: [a] -> a  
head1 = foldr1 (\x _ -> x)
head2 :: [a] -> a  
head2 = foldl1 (\x _ -> x)
--c)
maksimum1 :: (Ord a) => [a] -> a  
maksimum1 = foldr1 (\x c -> if x > c then x else c)
maksimum2 :: (Ord a) => [a] -> a  
maksimum2 = foldl1 (\x c -> if x > c then x else c)
--zad 8
unzip123 :: [(a,b)] -> ([a],[b])
unzip123 =  foldr (\(a,b) ~(as,bs) -> (a:as,b:bs)) ([],[])
--zad 9
f1 list = map (\x -> (x+9)/33) list
--f1 [1,2] = [0.30303030303030304,0.3333333333333333]
f2 list = map (\x -> (x^2/x^6)) list
--f2 [1,2,3] = [1.0,6.25e-2,1.2345679012345678e-2]
f3 list = map (\(x,y)-> x+y) list
-- f3 [(1,2),(3,4),(5,6)] = [3,7,11]
f4 list = map (\(x,y) -> x**y) list
--f4 [(1,2),(3,4),(3,2)] = [1.0,81.0,9.0]
f5 list = map (\(x,y,z)-> (x/y/z)) list
--f5 [(1,2,3),(4,5,6)] = [0.16666666666666666,0.13333333333333333]
f6 list = map (\x -> (4*x)/3312) list
--f6 [1,3,5,7] = [1.2077294685990338e-3,3.6231884057971015e-3,6.038647342995169e-3,8.454106280193236e-3]