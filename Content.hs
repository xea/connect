module Content (Collection, 
                Item, 
                generateContent, 
                loadCollectionIO, 
                saveCollection, 
                appendItem,
                groupItems,
                findGroup) where

import Import
import Data.Aeson(decodeStrict)
import Data.Aeson.Encode.Pretty(encodePretty)
import Data.List (find)
import System.Random
import GHC.Generics
import qualified Data.ByteString as BS(readFile)
import qualified Data.ByteString.Lazy as BL(writeFile)

data Item = Item { displayText :: String, answers :: [ String ] } deriving (Show, Read, Generic)
data Group = Group { groupId :: String, items :: [ Item ] } deriving (Show, Read, Generic)
data Collection = Collection { collectionGroups :: [ Group ] } deriving (Show, Read, Generic)

instance FromJSON Collection
instance FromJSON Group
instance FromJSON Item

instance ToJSON Collection
instance ToJSON Group
instance ToJSON Item

collectionPath :: FilePath
collectionPath = "collection.json"

saveCollection :: Collection -> IO ()
saveCollection collection = BL.writeFile collectionPath $ encodePretty collection

generateContent :: String -> StdGen -> Collection -> (String, [ String ])
generateContent ref gen coll = transformI $ (randomEs gen $ groupItems(findGroup coll ref)) !! 0

loadCollectionIO :: IO Collection
loadCollectionIO = do
  collectionData <- BS.readFile collectionPath
  return $ resolveCollection $ decodeStrict collectionData

resolveCollection :: Maybe Collection -> Collection
resolveCollection Nothing = Collection []
resolveCollection (Just coll) = coll

findGroup :: Collection -> String -> Maybe Group
findGroup coll ref = find (\g -> ref == groupId g) $ collectionGroups coll

groupItems :: Maybe Group -> [ Item ]
groupItems Nothing = []
groupItems (Just group) = items group

-- | Generates a random stream of elements of the given set of items
randomEs :: StdGen -> [ Item ] -> [ Item ]
randomEs gen gitems = map (gitems !!) $ randomRs (0, length gitems - 1) gen

-- | Transforms an Item into a displayable tuple of display string and it's possible answers
transformI :: Item -> (String, [ String ])
transformI item = (displayText item, answers item)

-- tree manipulation

appendItem :: String -> Collection -> Item -> Collection
appendItem ref coll item = Collection $ map (\g -> appendItemC g ref item) $ collectionGroups coll 

appendItemC :: Group -> String -> Item -> Group
appendItemC gr ref item
  | groupId gr == ref = Group (groupId gr) (item : items gr)
  | otherwise = gr

