---funkcje
pole a = 6*a^2

volume a b c=a*b*c

vol r h = 1/3*pi*r^2*h

czek a b c=if a+b>c && a+c>b && c+b>a then True else False

silnia 0=1
silnia n=n*silnia(n-1)

potega a n =if n==0 then 1 else a*potega a (n-1)

fib n | n==0         = 0
      | n==1         = 1
      | n>1          = fib (n-1) + fib (n-2)

fibex a = if a==fib a  then True else False

test x | x>2         = x^2
       | x<=0        = abs x
       | otherwise   = x-1
nwd a b= if a==b then b else if a>b then nwd (a-b) b else nwd a (b-a) 
nww a b = a*b/nwd a b
