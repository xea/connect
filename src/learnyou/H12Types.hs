module H12Types where

import qualified Data.Map as Map

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
} deriving (Show)

p1 = Person { firstName = "Harrison", lastName = "Ford", age = 67, phoneNumber = "+555112352" }
p2 = Person "Mark" "Hamill" 59 "+4441123213"

tellPerson :: Person -> String
tellPerson (Person { firstName = f, lastName = l, age = a, phoneNumber = p }) = f ++ " " ++ l ++ " was born in " ++ show a

-- type synonyms
type Actor = Person
type PhoneBook = [(String, String)]

-- type synonyms can be parameterised too
type MyMap k v = [(k, v)]

-- typeclass constraints
--data (Ord k) => ThisMap k v = ThisMap k v

-- partially applied types
type IntMap k = Map.Map Int k

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker number" ++ show lockerNumber ++ " doesn't exists"
        Just (state, code) -> if state /= Taken
            then Right code
            else Left $ "Locker " ++ show lockerNumber ++ " is already taken"

-- infix operators/functions
infixr 5 :-:
data InfixList a = Empty | a :-: (InfixList a)

l1 = 4 :-: 5 :-: 6 :-: Empty

-- infix functions
infixr 7 ++.
(++.) :: [a] -> [a] -> [a]
[] ++. ys = ys
(x:xs) ++. ys = x : (xs ++. ys)


