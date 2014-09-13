module Connect.Algorithms.A01Quicksort(quicksort) where

quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let biggerSorted = quicksort [ a | a <- xs, a >= x ]
        smallerSorted = quicksort [ a | a <- xs, a < x ]
    in smallerSorted ++ [x] ++ biggerSorted
