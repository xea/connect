module Connect.Euler.P004LargestPalindromeProduct(largestPalindromeProduct) where

import Data.List

largestPalindromeProduct = maximum $ map (\x -> read x :: Integer) $ filter (\x -> x == reverse x) $ map show $ nub . sort . intercalate [] $ map (\x -> map (\y -> x * y) [900..999]) [900..999]

