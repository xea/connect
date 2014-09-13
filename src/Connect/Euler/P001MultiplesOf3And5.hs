module Connect.Euler.P001MultiplesOf3And5(multiplesof) where

multiplesof :: Int -> Int -> Int 
multiplesof a b = sum [ x | x <- [1..999], mod x a == 0 || mod x b == 0 ]

