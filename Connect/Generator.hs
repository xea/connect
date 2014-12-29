module Connect.Generator where

import Import
import Connect.Core
import GHC.Generics
import System.Random

data Request = Request { displayText :: String, acceptedAnswers :: [ String ] } deriving (Show, Read, Generic)
data Response = Response { responsText :: String } deriving (Show, Read, Generic)  

-- | Generates an infinite list of "Item" elements where the generated list contains
-- elements from the provided list.
randomIs :: StdGen -> [ Item ] -> [ Item ]
randomIs gen gitems = map (gitems !!) $ randomRs (0, length gitems - 1) gen
