module P001MultiplesOf3And5 where

result = sum [ x | x <- [1..999], mod x 3 == 0 || mod x 5 == 0 ]

