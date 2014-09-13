
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let biggerSorted = quicksort [ a | a <- xs, a >= x ]
        smallerSorted = quicksort [ a | a <- xs, a < x ]
    in smallerSorted ++ [x] ++ biggerSorted

main :: IO ()
main = do
    putStrLn "Quicksort algorithm"
    putStrLn(show(quicksort [6, 2, 5, 7, 1, 8]))