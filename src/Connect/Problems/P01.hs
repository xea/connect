module Connect.Problems.P01(p01) where

p01 :: [a] -> a
p01 [] = error "No last for empty lists"
p01 [x] = x
p01 (x:xs) = p01 xs
