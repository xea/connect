module H02SetComprehensions where

s = [x * 2 | x <- [1..10]]
p = [x * 2 | x <- [1..20], mod x 3 == 0]
boombangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]

{-  -}

-- multiple predicates
arandomset xs = [ x * x | x <- xs, x /= 4, x/= 6]
crossproduct = [ x * y | x <- [1, 2, 3], y <- [6, 7, 8]]
length' xs = sum [ 1 | _ <- xs ]

-- multilist stuff
xxs = [ [ 2, 3, 4, 5 ], [ 2, 2, 3, 4, 5, 6, 6, 5, 2] ]
filtered = [ [ x | x <- xs, odd x ] | xs <- xxs ]