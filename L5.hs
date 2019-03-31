import Mojzbior
--zad 1
-- *Main> podzbior [1,2] [1,2,3,4]
-- True
-- *Main> suma [1,2,3] [5,6,7,8]
-- [1,2,3,5,6,7,8]
-- *Main> iloczyn [1,2,3] [2,3,1,4]
-- [1,2,3]
-- *Main> roznica [1,2,3] [3,2]
-- [1]
import Data.Map (fromListWith, toList)
--zad 2
w :: (Ord a) => [a] -> [(a, Int)]
w xs = toList (fromListWith (+) [(x, 1) | x <- xs])
--zad 3
data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)
t :: Tree Int
t = Node 1 (Node 2 (Node 4 Empty Empty)
                   (Node 5 Empty (Node 8 Empty Empty)))
           (Node 3 (Node 6 Empty (Node 9 Empty Empty))
                   (Node 7 Empty Empty))
--a)
depth :: Tree a -> Int
depth Empty = 0
depth (Node _ l r) = 1 + max (depth l) (depth r)
--b)
mindepth :: Tree a -> Int
mindepth Empty = 0
mindepth (Node _ l r) = 1 + min (mindepth l) (mindepth r)
--zad 4
inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node a l r) = inorder l ++ [a] ++ inorder r

checkListAsc :: (Ord a) => [a] -> Bool
checkListAsc [] = True
checkListAsc [x] = True
checkListAsc (x:y:xs) = x <= y && checkListAsc (y:xs)
--funkcja sprawdzajaca czy drzewo t jest uporzadkowane
test :: Ord a => Tree a -> Bool
test t = if(checkListAsc(inorder t)==True) then True else False
--zad 5
insert :: (Ord a) => a -> Tree a -> Tree a
insert x Empty = Node x Empty Empty
insert x (Node n left right)
  | x == n = Node n left right
  | x > n = Node n left (insert x right)
  | x < n = Node n (insert x left) right

treefromList :: (Ord a) => [a] -> Tree a
treefromList [] = Empty
treefromList xs = foldl (\tree x -> insert x tree) Empty xs

sort [] = []
sort(x:xs)=sort(filter(<x)xs)++
            [x]++
            sort(filter(>=x)xs)
--funkcja porzadkujaca drzewo t
uporzadkuj :: Ord a => Tree a -> Tree a
uporzadkuj t = treefromList(sort(inorder t))
--zad 6
class Adres a where
data Email = Mail1 | Mail2 | Mail3
instance Adres Email where
mail :: Email -> String
mail x = case x of
         Mail1 -> "qweqwd@wp.pl"
         Mail2 -> "adsfasda@gmail.com"
         Mail3 -> "jprzy@st.amu.edu.pl"
--Funkcja mail przyjmuje argument typu Email i zwraca String na wyjsciu
--Funkcja mail zwraca dla podanego Emaila odpowiadający mu ciąg znaków.
--Wywołania:
-- *Main> mail Mail1
--"qweqwd@wp.pl"
-- *Main> mail Mail2
--"adsfasda@gmail.com"
-- *Main> mail Mail3
--"jprzy@st.amu.edu.pl"