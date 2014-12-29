module Connect.Core (
) where

import Import
import Data.List (find)
import GHC.Generics

data SkillNode = Collection { collectionElems :: [ SkillNode ] } |
                 Group { groupId :: String, groupItems :: [ SkillNode ] } |
                 Item { itemText :: String, answers :: [ String ] } deriving (Show, Read, Ord, Eq, Generic)

-- | A "User" represents a real user of the software
data User = User { userEmail :: String } deriving (Show, Read, Generic)

-- | The "lookupRef" function attempts to find a "SkillNode" that matches the given reference value in the tree
lookupRef :: String -> SkillNode -> Maybe SkillNode
lookupRef ref cgr@(Group{ groupId = gid, groupItems = git })
  | ref == gid = Just cgr
  | otherwise  = foldl max Nothing $ map (lookupRef ref) git
lookupRef ref coll@(Collection { collectionElems = celems }) = foldl max Nothing $ map (lookupRef ref) celems
lookupRef ref _ = Nothing

-- | The "findItems" collects all the "Item" nodes from the given tree
findItems :: String -> SkillNode -> [ SkillNode ]
findItems ref c@(Collection _) = concat $ map (findItems ref) $ collectionElems c
findItems ref g@(Group _ _) = concat $ map (findItems ref) $ groupItems g
findItems ref i@(Item _ _) = [ i ]
