module Connect.Euler.P009SpecialPythagorean(findPythagorean) where

import Data.List

findPythagorean :: Float -> Float -> Float -> [(Float, Float, Float)]
findPythagorean target min max = filter (\(a, b, c) -> a + b + c == target) $ intercalate [] $ map (\x -> map (\y -> (x, y, sqrt ((x * x) + (y * y)))) [min..max]) [min..max]
