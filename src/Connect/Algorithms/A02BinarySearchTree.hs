module Connect.Algorithms.A02BinarySearchTree(Tree(..), singleton, insertTree, treeElem) where

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: Ord a => a -> Tree a
singleton a = Node a EmptyTree EmptyTree

insertTree :: Ord a => a -> Tree a -> Tree a
insertTree x EmptyTree = singleton x
insertTree x (Node a left right)
    | x == a = Node a left right
    | x < a  = Node a (insertTree x left) right
    | x > a = Node a left (insertTree x right)

treeElem :: Ord a => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a  = treeElem x left
    | x > a  = treeElem x right

--main :: IO ()
--main = do
--    putStrLn "Binary search tree algorithm"
--    putStrLn $ show $ foldr insertTree EmptyTree [ 4, 6, 1, 3, 5, 7, 8 ]
