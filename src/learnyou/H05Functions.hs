module H05Functions where

lucky :: Integral a => a -> [Char]
lucky 7 = "Lucky number seven"
lucky x = "Meh"

factorial :: Integral a => a -> a
factorial 0 = 1
factorial x = x * factorial (x - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

addPairs :: (Num a) => [(a, a)] -> [a]
addPairs xs = [ a + b | (a, b) <- xs ]

capital :: String -> String
capital "" = "Empty string"
capital all@(x:xs) = "The first letter of the word " ++ all ++ " is " ++ [x] ++ " and the rest is " ++ xs

bodymass :: (RealFloat a) => a -> String
bodymass bmi
	| bmi <= 18.5 = "Lofasz"
	| bmi <= 30.2 = "Nem is annyira lofasz"
	| otherwise = "Pedig ez is lofasz am"

-- inline guards

max' :: (Ord a) => a -> a -> a
max' a b | a > b = a | otherwise = b

-- we can also bind values to name

bodymass' :: (RealFloat a) => a -> a -> String
bodymass' weight height
	| bmi <= 18.5 	= "Buzi vagy"
	| otherwise		= "Die"
	where bmi = weight / height ^ 2

-- pattern matching for binding names
bodymass'' :: (RealFloat a) => a -> a -> String
bodymass'' weight height
	| bmi <= skinny	= "Sovany vagy"
	| bmi <= normal = "Normalis vagy"
	| bmi <= fat 	= "Dagadt vagy"
	| otherwise		= "WTF"
	where (bmi, skinny, normal, fat) = (weight / height ^ 2, 18.5, 25.4, 30.2)

-- another example
initials :: String -> String -> (Char, Char)
initials firstname lastname = (f, l)
	where
		(f:_) = firstname
		(l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [ bmi w h | (w, h) <- xs ]
	where
		bmi weight height = weight / height ^ 2

-- let is almost the same as where but where is syntactic sugar and let is an expression
triplet = [ let double x = x * 2 in (double 4, double 7, double 9)]

-- because let is an expression, we can use it in set comprehensions
calcBmis' :: (RealFloat a) => [(a, a)] -> [a]
calcBmis' xs = [ bmi | (w, h) <- xs, let bmi = w / h ^ 2 ]
