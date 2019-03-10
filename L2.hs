--zad 1
--a)
dodaj1 x xs = x:xs
--b)
dodaj2 z x= head(x):z:tail(x)
--c)
ost x xs= xs++[x]
--zad2
--a)
second x=head (tail x)
--b)
trzeci x=head (tail(tail x))
--c)
przed x= second (reverse x)
--zad3
odwroc []=[]
odwroc(x:xs)=odwroc xs++[x]
--zad4
zam [] = []
zam [x] = [x]
zam (x:xs) = (last xs : init xs) ++ [x]
--zad5
parz x=even(length x)
--zad6
--a)
sqrlist1 x=map square x 
    where square y=y*y
--b)
sqrlist2 x=test square x
    where square y=y*y
          test f xs = [f x | x <- xs]
--zad7
count(_,[]) = 0
count(x,list) = sum ( map (\a -> 1) ( filter (== x) list ) )
--zad8
duplicate(xs,n) = concat ( map (\x -> take n (repeat x)) [xs])
--zad9
usunf _ [] = [] 
usunf a (b:bc) | a == b    = bc 
               | otherwise = b : usunf a bc
--zad10
usunN _ []     = []
usunN f (a:b)
   | f == 0    = b
   | otherwise = a : usunN (f-1) b
--zad11
rowne a b = sort a == sort b
        where sort [] = []
              sort(x:xs)=sort(filter(<x)xs)++
                    [x]++
                    sort(filter(>=x)xs)
--zad12
krotki :: [(Int, Char)]->[(Char, Int)]
krotki [] = []
krotki (x:xs) = (snd x,fst x) : (krotki xs)
--Zadania domowe
--a
potega a n=if n==0 then 1 else potegaPOM a n 1
potegaPOM a n ak=if n==0 then ak else potegaPOM a (n-1) (ak*a)
--b
punkty x1 y1 x2 y2 = if ((0-x1)^2+(0-y1)^2)**0.5 > ((0-x2)^2+(0-y2)^2)**0.5 then "P1 jest dalej" else if ((0-x1)^2+(0-y1)^2)**0.5 == ((0-x2)^2+(0-y2)^2)**0.5 then "rowna odleglosc" else "P2 jest dalej" 
--c
suma1 n = if n==0 then 0 else n+suma1(n-1)
--d
suma2 n = sumaPOM n 0 
sumaPOM n ak=if n==0 then ak else sumaPOM (n-1) (ak+n)        
--e
an1 n | n==1         = 0
      | n==2         = 1
      | n>2          = 2*an1(n-1) - an1(n-2)
--f
an2 n=if n==1 then 0 else if n==2 then 1 else anPOM n 0 1
anPOM n f1 f2=if n==1 then f1 else anPOM (n-1) (f1+f2)f2
--g
fkw a b c =if d ==0 then (-b/(2*a),-b/(2*a)) else if d >0 then x01 else (-0,-0)
        where x01= ((-b+(b^2-4*a*c)**0.5)/(2*a),(-b-(b^2-4*a*c)**0.5)/(2*a))
              d=b^2-4*a*c
---fkw zwraca dla d <0 => (-0,-0) 
--h
lel a b c | a>=b && a>=c   =  a
          | b>=a && b>=c   =  b
          | c>=a && c>=b   =  c