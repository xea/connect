module Connect.Core (
) where

import Import
import Data.List (find)
import GHC.Generics

data SkillNode = Collection { collectionElems :: [ SkillNode ] } |
                 Group { groupId :: String, groupItems :: [ SkillNode ] } |
                 Item { itemText :: String, answers :: [ String ] } deriving (Show, Read, Ord, Eq, Generic)

data Node = Node { nodeId :: String, nodes :: [ Node ] }

class Browsable a where
  findN :: a -> [ SkillNode ]

instance Browsable SkillNode where
  findN c@(Collection _) = concat $ map (findItems) $ collectionElems c
  findN g@(Group _ _) = concat $ map (findItems) $ groupItems g
  findN i@(Item _ _) = [ i ]

instance (Browsable a) => Browsable (Maybe a) where
  findN Nothing = []
  findN (Just a) = findN a

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
findItems :: SkillNode -> [ SkillNode ]
findItems c@(Collection _) = concat $ map (findItems) $ collectionElems c
findItems g@(Group _ _) = concat $ map (findItems) $ groupItems g
findItems i@(Item _ _) = [ i ]

testData :: SkillNode
testData = Collection 
            [ Group "English" 
              [ Group "Reading" 
                [ Group "Vowels" 
                  [ Item "A" [],
                    Item "E" [],
                    Item "I" []
                  ],
                  Group "Consonants"
                  [ Item "K" [],
                    Item "L" [] ] ] ],
              Group "German" 
                [ Group "Fachte" 
                  [ Item "der Tisch" [],
                    Item "der Mann" [] 
                  ] ] ]
