module Connect.Core where

import Import
import GHC.Generics

data Node = Collection { nodeChildren :: [ Node ] } |
            Group { groupId :: String, nodeChildren :: [ Node ] } |
            ContentGroup { groupId :: String, groupItems :: [ Item ] } deriving (Show, Read, Ord, Eq, Generic)

data Item = Item { displayText :: String, answers :: [ String ] } deriving (Show, Read, Ord, Eq, Generic)

class Browsable a where
  -- Returns every Item instance that are organised below the given node
  findI :: a -> [ Item ]
  -- Returns the immediate children of the given node
  children :: a -> [ Node ]
  -- | The "lookupRef" function attempts to find a "Node" that matches the given reference value in the tree
  lookupRef :: String -> a -> Maybe Node
  addItem :: String -> Item -> a -> Node
  addNode :: Node -> a -> Node
  addNodeR :: String -> Node -> a -> Node

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
  lookupRef ref cgr@(ContentGroup gid _)
    | ref == gid = Just cgr
    | otherwise  = Nothing
  lookupRef ref (Collection celems) = foldl max Nothing $ map (lookupRef ref) celems
  lookupRef _ _ = Nothing

  addItem ref item cgr@(ContentGroup gid git) = if gid == ref then ContentGroup gid (git ++ [ item ]) else cgr
  addItem ref item (Group gid git) = Group gid $ map (addItem ref item) git
  addItem ref item (Collection git) = Collection $ map (addItem ref item) git

  addNode newNode (Collection git) = Collection (git ++ [ newNode ])
  addNode newNode (Group gid git) = Group gid (git ++ [ newNode ])
  addNode newNode cgr@(ContentGroup _ _) = cgr

  addNodeR ref item (Collection git) = Collection $ map (addNodeR ref item) git
  addNodeR ref item (Group gid git) = if gid == ref then Group gid (git ++ [ item ]) else Group gid $ map (addNodeR ref item) git
  addNodeR ref item cgr@(ContentGroup _ _) = cgr

instance (Browsable a) => Browsable (Maybe a) where
  findI Nothing = []
  findI (Just a) = findI a
  children Nothing = []
  children (Just a) = children a
  lookupRef _ Nothing = Nothing
  lookupRef ref (Just a) = lookupRef ref a
  addItem ref item Nothing = addItem ref item $ Group "" []
  addItem ref item (Just a) = addItem ref item a
  addNode newNode Nothing = Collection [ newNode ]
  addNode newNode (Just a) = addNode newNode a
  addNodeR _ node Nothing = Collection [ node ]
  addNodeR ref node (Just b) = addNodeR ref node b

-- | A "User" represents a real user of the software
data User = User { userEmail :: String } deriving (Show, Read, Generic)

