module P003LargestPrimeFactor where

import Data.Numbers.Primes

f :: Int -> Int -> Int
f n 1 = n
f n d 
	| n == d 	= n
	| modulo > 0 	= n
	| modulo == 0 	= f (quot n d) d
	where modulo = mod n d
f n _ = n

primefactor :: Int -> Int
primefactor n = foldl (\acc x -> f acc x ) n $ takeWhile (\x -> x < n) primes

result = primefactor 600851475143

main :: IO ()
main = do
	putStrLn $ show result
