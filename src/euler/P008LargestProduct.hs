import Data.Char

-- 36368563225

iterate' :: Int -> Int -> String -> Int
iterate' n acc str@(x:xs)
	| remaining < n  = acc
	| remaining >= n = if (currentsum < acc) then iterate' n acc xs else iterate' n currentsum xs
	where remaining = length str
	      currentsum = foldl (\a b -> a * b) 1 $ map digitToInt $ take n str
iterate' _ _ _ = 0

largestProduct :: String -> Int
largestProduct str = iterate' 13 0 str

main :: IO ()
main = do
	c <- getContents
	putStrLn c
	putStrLn $ show $ largestProduct $ init c
