module Connect.Euler.P002EvenFibonacci(limitedFibonacci) where

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n - 1) + fibonacci(n - 2)

limitedFibonacci :: Int
limitedFibonacci = sum(takeWhile(\x -> x < 4000000) (filter(\x -> even x) (map (\x -> fibonacci x) [2..])))

