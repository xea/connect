module Main(main) where

import Connect.Algorithms.A01Quicksort
import Connect.Algorithms.A02BinarySearchTree

import Connect.Euler.P009SpecialPythagorean

a01result = quicksort [5, 6, 1, 2, 9]
a02result = foldr insertTree EmptyTree [ 4, 6, 1, 3, 5, 7, 8 ]

e09result = findPythagoreanSum 1000 100 1000

main :: IO ()
main = do
    putStrLn $ "Quicksort test: " ++ show a01result
    putStrLn $ "Binary Search Tree test: " ++ show a02result
    putStrLn $ "Euler problem   9 result: " ++ show e09result
