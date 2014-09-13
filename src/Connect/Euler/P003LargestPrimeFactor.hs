module Connect.Euler.P003LargestPrimeFactor(primefactor) where

import Data.Numbers.Primes

f :: Int -> Int -> Int
f n 1 = n
f n d 
	| n == d 	= n
	| modulo > 2 	= n
	| modulo == 0 	= f (quot n d) d
	where modulo = mod n d
f n _ = n

primefactor :: Int -> Int
primefactor n = foldl (\acc x -> f acc x ) n $  takeWhile (\x -> x < 7000) primes
