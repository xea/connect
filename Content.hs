module Content(Collection, Item, generateContent, loadCollectionIO, appendItem) where

import Import
import Data.Aeson(decode, decodeStrict)
import Data.Aeson.Encode.Pretty(encodePretty)
import Data.List (find)
import System.Random
import GHC.Generics
import qualified Data.ByteString as BS(readFile, writeFile, ByteString)
import qualified Data.ByteString.Lazy as BL(readFile, writeFile, ByteString)

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

--loadCollectionFile :: IO BS.ByteString
--loadCollectionFile = BS.readFile collectionPath

generateContent :: String -> StdGen -> Collection -> (String, [ String ])
generateContent ref gen coll = transformI $ (randomEs gen $ groupItems(findGroup coll ref)) !! 0

loadCollectionIO :: IO Collection
loadCollectionIO = do
  collectionData <- BS.readFile collectionPath
  return $ resolveCollection $ decodeStrict collectionData

resolveCollection :: Maybe Collection -> Collection
resolveCollection Nothing = Collection []
resolveCollection (Just coll) = coll

appendItem :: String -> Collection -> Item -> IO ()
appendItem ref coll item = saveCollection coll 

findGroup :: Collection -> String -> Maybe Group
findGroup coll ref = find (\g -> ref == groupId g) $ collectionGroups coll

groupItems :: Maybe Group -> [ Item ]
groupItems Nothing = []
groupItems (Just group) = items group

randomEs :: StdGen -> [ Item ] -> [ Item ]
randomEs gen items = map (items !!) $ randomRs (0, length items - 1) gen

transformI :: Item -> (String, [ String ])
transformI item = (displayText item, answers item)

