module Connect.Generator where

import Import
import Connect.Core
import Connect.Util
import System.Random

-- | Generates an infinite list of "Item" elements where the generated list contains
-- elements from the provided list.
randomIs :: StdGen -> [ Item ] -> [ Item ]
randomIs _ [] = []
randomIs gen gitems = map (gitems !!) $ randomRs (0, length gitems - 1) gen

generateChallenge :: String -> StdGen -> Maybe Node -> Request
generateChallenge _ _ Nothing = emptyRequest
generateChallenge ref gen (Just coll) = createRequest (randomIs gen $ findI $ lookupRef ref coll )

createRequest :: [ Item ] -> Request
createRequest [] = emptyRequest
createRequest ((Item a b):_) = Request a b

-- | Returns an empty request
emptyRequest :: Request
emptyRequest = Request "<Error: empty node>" []
