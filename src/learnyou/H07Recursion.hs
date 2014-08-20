module H07Recursion where

factorial' :: Int -> Int
factorial' 0 = 1
factorial' x = x * factorial' x - 1

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "maximum of empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort [x] = [x]
quicksort (x:xs) =
    let lower = quicksort [ a | a <- xs, a <= x ]
        bigger = quicksort [ a | a <- xs, a > x ]
    in lower ++ [x] ++ bigger
