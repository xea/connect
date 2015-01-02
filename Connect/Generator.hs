module Connect.Generator where

import Import
import Connect.Core
import Connect.Util
import GHC.Generics
import System.Random

-- | Generates an infinite list of "Item" elements where the generated list contains
-- elements from the provided list.
randomIs :: StdGen -> [ Item ] -> [ Item ]
randomIs gen gitems = map (gitems !!) $ randomRs (0, length gitems - 1) gen

generateChallenge :: String -> StdGen -> Maybe Node -> Request
generateChallenge ref gen Nothing = Request "" []
generateChallenge ref gen (Just coll) = Request "Bli bli" [ "alma" ] 
