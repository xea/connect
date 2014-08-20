module H002EvenFibonacci where

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n - 1) + fibonacci(n - 2)

--result = sum [ fibonacci x | x <- [1..], fibonacci x < 40, even(fibonacci x) ]
result = sum(takeWhile(\x -> x < 4000000) (filter(\x -> even x) (map (\x -> fibonacci x) [2..])))
