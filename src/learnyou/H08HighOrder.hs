module H08HighOrder where

-- If we don't supply every argument to a function call then the function is only partially applied
addThree :: (Num a) => a -> a -> a -> a
addThree a b c = a + b + c

-- Partially applied functions can be used to form other functions too
addTwo :: (Num a) => a -> a -> a
addTwo a b = addThree 2 a b

addOne :: (Num a) => a -> a
addOne a = addTwo 4 a

addAll :: (Num a) => a 
addAll = addOne 5

-- parentheses are used to section an infix function
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperCase :: Char -> Bool
isUpperCase = (`elem` ['A'..'Z'])

-- functions can take functions as parameters
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f(f x)

r1 = applyTwice (/33) 100
r2 = applyTwice (3:) [1]
r3 = addOne 3

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

r4 = zipWith' (+) [1, 2, 3] [4, 5, 6]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where g x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

r5 = map' (+4) [3, 2, 4, 5]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    | f x       = x:filter' f xs
    | otherwise = filter' f xs

r6 = filter' (> 4) [1, 5, 9, 2, 3, 6]

-- calculate sum of every odd square below 10000
r7 = sum(takeWhile (< 10000) (filter odd (map(^2) [1..])))

-- the same with list comprehension
r8 = sum(takeWhile (< 10000) [x ^ 2 | x <- [1..], odd (x^2)])

-- currying to the extreme
r9 = map (*) [1..8]
r10 = (r9 !! 4) 5

-- function application is done with $
r11 = map (+4) $ [1, 2, 3]
