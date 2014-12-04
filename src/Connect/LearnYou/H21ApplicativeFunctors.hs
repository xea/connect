module Main(main) where

import Control.Applicative

data Item = Item String deriving (Show)
data Sequence a = Sequence [a] deriving (Show)

instance Functor Sequence where
    fmap f (Sequence x) = Sequence (map f x)

instance Applicative Sequence where
    pure x = Sequence [x]
    (Sequence s) <*> sq = fmap s sq

main :: IO ()
main = do
    putStrLn "Hello"
