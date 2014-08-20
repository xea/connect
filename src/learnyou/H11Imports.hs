module H11Imports where

import Data.List
import Data.List (nub, length, sort)
import Data.List hiding (nub)
import qualified Data.List as L

-- puts and element between elements of a list
r1 = intersperse '.' "Monkey"                               -- M.o.n.k.e.y

-- puts a list between lists in a list of lists
r2 = intercalate " " [ "This", "really", "is", "nice" ]     -- "This really is nice"

-- transpose
r3 = transpose [ [1, 2], [3, 4] ]                           -- [ [1, 3], [2, 4] ]

-- flattens a list of lists
r4 = concat [ "Hello", ", ", "world" ]                      -- "Hello, world"

-- concatMap flattens a list of lists with a function
r5 = concatMap (\x -> x ++ "..") [ "Hello", ", ", "world" ] -- "Hello.., .., world.."
-- same as above
r6 = concatMap (++ "..") [ "Hello", ", ", "world" ]         -- "Hello.., .., world.."

-- true, if every element is true
r7 = and $ map (> 4) [5, 6, 7, 8]
r8 = and $ map (> 4) [3, 4, 5, 6]

-- true, if any element is true
r9 = or $ map (> 4) [1, 2, 3, 4, 5]
r10 = or $ map (> 4) [1, 2, 3, 4]

-- checks if any of the elements satisfy the predicate
r11 = any (> 4) [3, 4, 5]

-- checks if every element satisfies the predicate
r12 = all (> 4) [5, 6, 7]
