module Main(main) where

data Item = Item String deriving (Show)
data Sequence a = Sequence [a] deriving (Show)

instance Functor Sequence where
    fmap f (Sequence xs) = Sequence (map f xs)

-- 
reverseItem :: Item -> Item
reverseItem (Item s) = Item (reverse s)

-- fmap :: (a -> b) -> f a -> f b
main :: IO ()
main = do
    putStrLn $ show $ fmap reverseItem (Sequence ([ Item "Alma", Item "Korte" ]))
