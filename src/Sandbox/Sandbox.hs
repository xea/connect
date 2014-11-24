module Main where

import Control.Applicative
import Data.Char

class Test a where
  (>>>) :: a -> a -> a 

infixl 6 >>>

instance Test Bool where
  (>>>) a b = if (a == True) then b else False 

main = do
  putStrLn $ show $ True >>> False
  putStrLn $ show $ map reverse [ "Alma", "Korte", "Ananasz" ]
  putStrLn "Hello azz"

-- vim: et:sw=2:tw=2
