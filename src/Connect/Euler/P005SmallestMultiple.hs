module Connect.Euler.P005SmallestMultiple(smallestMultiple) where

smallestMultiple = take 2 [ n | n <- [100..], (foldl (\acc x -> acc + x) 0 $ map (mod n) [1..20]) == 0]

