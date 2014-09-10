module Main(main) where

myfunction :: String -> String
myfunction name = reverse name

main :: IO ()

main = do
    putStrLn $ myfunction "Lofasz"
    putStrLn "Hello, World again"
