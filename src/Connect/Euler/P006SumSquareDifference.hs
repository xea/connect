
sumofsquares :: Int -> Int
sumofsquares n = foldl (\acc x -> acc + x) 0 $ map (\x -> x * x) [1..n]

squareofsums :: Int -> Int
squareofsums n = sum * sum where sum = foldl (\acc x -> acc + x) 0 [1..n]

diff n = squareofsums n - sumofsquares n

result = diff 100

