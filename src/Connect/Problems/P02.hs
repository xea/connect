module Connect.Problems.P02(p02) where

p02 :: [a] -> a
p02 [] = error "Requires a list with more than one element"
p02 [x] = error "Requires a list with more than one element"
p02 (x:xs) = 
