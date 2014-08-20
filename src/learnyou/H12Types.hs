module H12Types where

-- one way of creating our own type is with the keyword data
data Bool = True | False

-- the parts after the = are value constructors
data PositiveEven = Num | Char

data Shape = Circle Float Float Float | Rectangle Float Float Float Float

-- from now on these types can be used

surface :: Shape -> Float
surface (Circle _ _ r) = r ^ 2 * pi
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

s1 = surface $ Circle 0 0 10
s2 = surface $ Rectangle 0 0 3 3

-- to make a type part of a typeclass we use deriving
data Square = Float Float Float deriving (Show)

-- since value constructors are just functions too, we can use them like any function
r1 = map (Circle 0 0) [4, 5]

-- we can define types with the record syntax too
data Person = Person {
    firstName :: String,
    lastName :: String,
    age :: Int,
    phoneNumber :: String
}