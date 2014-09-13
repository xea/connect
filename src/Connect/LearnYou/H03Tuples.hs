module H03Tuples where

atuple = (3, 4)
listoftuples = [(1, 2) , (3, 4), (0, 3)]

-- creating tuples from two lists
manytuples = zip [1, 2, 3, 4] ['a', 'b', 'c', 'd']

-- find triangle
possiblesizes = [ (a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2, a+b+c == 24 ]
