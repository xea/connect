module H04Types where

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase xs = [ c | c <- xs, elem c [ 'A'..'Z' ] ]

factorial :: Int -> Int
factorial x = product [ 1..x ]

