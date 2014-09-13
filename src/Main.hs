module Main(main) where

import Connect.Algorithms.A01Quicksort
import Connect.Algorithms.A02BinarySearchTree

import Connect.Euler.P001MultiplesOf3And5
import Connect.Euler.P002EvenFibonacci
import Connect.Euler.P003LargestPrimeFactor
import Connect.Euler.P004LargestPalindromeProduct
import Connect.Euler.P005SmallestMultiple
import Connect.Euler.P009SpecialPythagorean

a01result = quicksort [5, 6, 1, 2, 9]
a02result = foldr insertTree EmptyTree [ 4, 6, 1, 3, 5, 7, 8 ]

e01result = multiplesof 3 5
e02result = limitedFibonacci
e03result = primefactor 600851475143
e04result = largestPalindromeProduct
e05result = smallestMultiple
e09result = findPythagorean 1000 100 1000

main :: IO ()
main = do
    putStrLn $ "Quicksort test: " ++ show a01result
    putStrLn $ "Binary Search Tree test: " ++ show a02result
    putStrLn $ "Euler problem   1 result: " ++ show e01result
    putStrLn $ "Euler problem   2 result: " ++ show e02result
    putStrLn $ "Euler problem   3 result: " ++ show e03result
    putStrLn $ "Euler problem   4 result: " ++ show e04result
    putStrLn $ "Euler problem   5 result: " ++ show e05result
    putStrLn $ "Euler problem   9 result: " ++ show e09result
