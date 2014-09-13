
result = take 1 [ n | n <- [100..], (foldl (\acc x -> acc + x) 0 $ map (mod n) [1..20]) == 0]

main : IO ()
main = do
    putStrLn $ show result