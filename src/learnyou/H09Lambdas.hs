module H09Lambdas where

elemlength :: [String] -> [Int]
elemlength [] = []
elemlength xs = map (\x -> length x) xs

r0 = elemlength ["This must be nice or else"]

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x
