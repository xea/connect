module P004LargestPalindromeProduct where

import Data.List

result = maximum $ map (\x -> read x :: Integer) $ filter (\x -> x == reverse x) $ map show $ nub . sort . intercalate [] $ map (\x -> map (\y -> x * y) [900..999]) [900..999]

main :: IO ()
main = do
    putStrLn $ show result
