module Connect.Euler.P005SmallestMultiple(smallestMultiple) where

smallestMultiple = take 1 $ filter (\x -> all ((==) 0) $ map (mod x) [20,19,18,17,16,15,14,13,11]) [100..]
