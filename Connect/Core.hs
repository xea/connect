module Connect.Core where

import Import
import Data.List (find)
import GHC.Generics

data Node = Collection { collectionElems :: [ Node ] } |
            Group { groupId :: String, groupChildren :: [ Node ] } |
            ContentGroup { groupId :: String, groupItems :: [ Item ] } deriving (Show, Read, Ord, Eq, Generic)

data Item = Item { displayText :: String, answers :: [ String ] } deriving (Show, Read, Ord, Eq, Generic)

class Browsable a where
  findI :: a -> [ Item ]

instance Browsable Node where
  findI (Collection c) = concat $ map (findI) c
  findI (Group _ gc) = concat $ map (findI) $ gc
  findI (ContentGroup _ git) = git

instance (Browsable a) => Browsable (Maybe a) where
  findI Nothing = []
  findI (Just a) = findI a

-- | A "User" represents a real user of the software
data User = User { userEmail :: String } deriving (Show, Read, Generic)

-- | The "lookupRef" function attempts to find a "Node" that matches the given reference value in the tree
lookupRef :: String -> Node -> Maybe Node
lookupRef ref cgr@(Group{ groupId = gid, groupChildren = git })
  | ref == gid = Just cgr
  | otherwise  = foldl max Nothing $ map (lookupRef ref) git
lookupRef ref (Collection { collectionElems = celems }) = foldl max Nothing $ map (lookupRef ref) celems
lookupRef _ _ = Nothing

testData :: Node
testData = Collection [  
             Group "English" [
               Group "Reading" [] ],
             Group "German" [],
             ContentGroup "" [] ]
