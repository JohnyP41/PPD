import Control.Monad
--zad 1
dwieliczby = do putStr "Podaj pierwsza liczbe: "
                n <- getLine
                let x = read n
                putStr "Podaj druga liczbe: "
                n <- getLine
                let y = read n
                    z1 = x + y
                    z2 = x * y
                    z3 = x - y
                    z4 = x / y
                putStrLn ("Suma liczb " ++ show x ++" i "++ show y ++" to: "++ show z1)
                putStrLn ("Iloczyn liczb " ++ show x ++" i "++ show y ++" to: "++ show z2)
                putStrLn ("Roznica liczb " ++ show x ++" i "++ show y ++" to: "++ show z3)
                putStrLn ("Iloraz liczb " ++ show x ++" i "++ show y ++" to: "++ show z4)
--zad 2
nwd a b= if a==b then b else if a>b then nwd (a-b) b else nwd a (b-a)
nww a b = a*b/nwd a b

habahbhsh = do putStr "Podaj pierwsza liczbe: "
               n <- getLine
               let x = read n
               putStr "Podaj druga liczbe: "
               n <- getLine
               let y = read n
                   a = nwd x y
                   b = nww x y
               putStrLn ("NWD: " ++ show a)
               putStrLn ("NWW: " ++ show b)
--zad 3
imie = do putStr "Podaj imie: "
          im <- getLine
          putStr "Podaj nazwisko: "
          naz <- getLine
          let x = [head im] ++ [head naz]
          putStr ("Inicjaly: " ++ [head im] ++ "." ++ [head naz] ++ "." ++ "\n")
--zad 4
gameloop 0 = do putStr "Przegrales! \n"
gameloop n = do putStr "Podaj liczbe (0-99): "
                x <- getLine
                let num = read x :: Int
                when (num == 77) $ do
                     putStr "Gratulacje, wygrales! \n"
                when (num < 77) $ do
                     putStr "Twoja liczba jest za mala! \n"
                     gameloop (n-1)
                when (num > 77) $ do
                     putStr "Twoja liczba jest za duza! \n"
                     gameloop (n-1)
gra = gameloop 10