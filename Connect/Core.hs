module Connect.Core where

import Import
import Data.List (find)
import Data.Text as T (pack, unpack)
import GHC.Generics

data Node = Collection { nodeChildren :: [ Node ] } |
            Group { groupId :: String, nodeChildren :: [ Node ] } |
            ContentGroup { groupId :: String, groupItems :: [ Item ] } deriving (Show, Read, Ord, Eq, Generic)

data Item = Item { displayText :: String, answers :: [ String ] } deriving (Show, Read, Ord, Eq, Generic)

class Browsable a where
  findI :: a -> [ Item ]
  children :: a -> [ Node ]
  lookupRef :: String -> a -> Maybe Node

instance Browsable Node where
  findI (Collection c) = concat $ map (findI) c
  findI (Group _ gc) = concat $ map (findI) $ gc
  findI (ContentGroup _ git) = git
  children (Collection c) = c
  children (Group _ c) = c
  children _ = []
  lookupRef ref cgr@(Group gid git)
    | ref == gid = Just cgr
    | otherwise  = foldl max Nothing $ map (lookupRef ref) git
  lookupRef ref (Collection celems) = foldl max Nothing $ map (lookupRef ref) celems
  lookupRef _ _ = Nothing

instance (Browsable a) => Browsable (Maybe a) where
  findI Nothing = []
  findI (Just a) = findI a
  children Nothing = []
  children (Just a) = children a
  lookupRef _ Nothing = Nothing
  lookupRef ref (Just a) = lookupRef ref a

-- | A "User" represents a real user of the software
data User = User { userEmail :: String } deriving (Show, Read, Generic)

-- | The "lookupRef" function attempts to find a "Node" that matches the given reference value in the tree
