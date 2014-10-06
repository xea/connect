module Connect.LearnYou.H17ReversePolishCalculator where

solveRPN :: (Num a, Read a) => String -> a
solveRPN = head . foldl foldingFunction [] . words
    where foldingFunction (x:y:xs) "*" = (x * y):xs
          foldingFunction (x:y:xs) "+" = (x + y):xs
          foldingFunction (x:y:xs) "-" = (x - y):xs
          foldingFunction xs number = read number:xs

rpnresult = solveRPN "4 7 2 + - 10 *"

main = putStrLn $ show rpnresult
