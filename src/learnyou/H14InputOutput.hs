
main = do
    putStrLn "Hello, what is your name?"
    name <- getLine
    putStrLn ("Hello, " ++ name)

    {- -}
    if null name
        then return()
        else do
            putStrLn $ reverseString name
            main

reverseString :: String -> String
reverseString = unwords . map reverse . words
