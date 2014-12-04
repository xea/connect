module Main(quicksort, main) where

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let biggerSorted = quicksort [ a | a <- xs, a >= x ]
        smallerSorted = quicksort [ a | a <- xs, a < x ]
    in smallerSorted ++ [x] ++ biggerSorted

main :: IO ()
main = putStrLn $ show $ quicksort [ 4, 2, 5, 2 ]
