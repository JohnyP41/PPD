--zad 1
data Moto = Toyota | Fiat | Audi | Renault | Chevrolet
            deriving (Show)
type Kraj = [Char]
marka :: Kraj -> Moto
marka x = case x of
          "Japonia" -> Toyota
          "Wlochy" -> Fiat
          "Niemcy" -> Audi
          "Francja" -> Renault
          "USA" -> Chevrolet
szybkosc :: Moto -> Int
szybkosc x = case x of
          Toyota -> 220
          Fiat -> 150
          Audi -> 250
          Renault -> 250
          Chevrolet -> 230
--zad 2
data Tree a = Empty | Node a (Tree a) (Tree a)
t :: Tree Int
t = Node 1 (Node 2 (Node 4 Empty Empty)
                   (Node 5 Empty (Node 8 Empty Empty)))
           (Node 3 (Node 6 Empty (Node 9 Empty Empty))
                   (Node 7 Empty Empty))
s :: Tree Char
s = Node 'a' (Node 'b' Empty (Node 'd' (Node 'f' Empty Empty) Empty)) (Node 'c' (Node 'e' Empty (Node 'g' Empty Empty)) Empty)

preorder :: Tree a -> [a]
preorder Empty = []
preorder (Node a l r) = [a] ++ preorder l ++ preorder r

inorder :: Tree a -> [a]
inorder Empty = []
inorder (Node a l r) = inorder l ++ [a] ++ inorder r

postorder :: Tree a -> [a]
postorder Empty = []
postorder (Node a l r) = postorder l ++ postorder r ++ [a]
-- *Main> inorder t
-- [4,2,5,8,1,6,9,3,7]
-- *Main> preorder t
-- [1,2,4,5,8,3,6,9,7]
-- *Main> postorder t
-- [4,8,5,2,9,6,7,3,1]
-- *Main> inorder s
-- "bfdaegc"
-- *Main> preorder s
-- "abdfceg"
-- *Main> postorder s
-- "fdbgeca"
--zad 3
--preorder
tree_member1 :: Eq a => Tree a -> a -> Bool
tree_member1 Empty x = False
tree_member1 (Node a l r) x | a == x = True
                            | tree_member1 l x == True = True
                            | otherwise = tree_member1 r x
--inorder
tree_member2 :: Eq a => Tree a -> a -> Bool
tree_member2 Empty x = False
tree_member2 (Node a l r) x | tree_member2 l x == True = True
                            | a == x = True
                            | otherwise = tree_member2 r x
--postorder
tree_member3 :: Eq a => Tree a -> a -> Bool
tree_member3 Empty x = False
tree_member3 (Node a l r) x | tree_member3 l x == True = True
                            | tree_member3 r x == True = True
                            | a == x = True
                            | otherwise = False
--zad 4
subtree :: Eq a => Tree a -> Tree a -> Bool
subtree a b=subList (preorder a) (preorder b)
    where subList [] [] = True
          subList _ []    = False
          subList [] _    = True
          subList (x:xs) (y:ys) 
               | x == y    = subList xs ys   
               | otherwise = subList (x:xs) ys
--zad 5
poziomo :: Tree a -> [a]
poziomo Empty = []
poziomo tr = bf [tr]
    where
        bf [] = []
        bf xs = map root xs ++ bf (concat (map children xs))
        root (Node x _ _) = x
        children (Node _ Empty Empty) = []
        children (Node _ Empty b) = [b]
        children (Node _ a Empty) = [a]
        children (Node _ a b) = [a,b]