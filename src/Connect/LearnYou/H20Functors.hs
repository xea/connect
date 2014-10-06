module Connect.LearnYou.H20Functors where

main = do line <- fmap reverse getLine
          putStrLn line
