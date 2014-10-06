module Connect.Euler.P010SumOfPrimes(sumOfPrimes) where

import Data.Numbers.Primes

sumOfPrimes = foldl (\acc x -> acc + x) 0 $ takeWhile (< 2000000) primes
