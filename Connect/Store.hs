module Connect.Store where

import Import
import Connect.Core 
import Data.Aeson (decodeStrict)
import Data.Aeson.Encode.Pretty (encodePretty)
import qualified Data.ByteString as BS(readFile)
import qualified Data.ByteString.Lazy as BL(writeFile)

instance ToJSON Node
instance FromJSON Node

instance ToJSON Item
instance FromJSON Item

-- Defines the filename where the collection data is retrieved from/saved to
collectionPath :: FilePath
collectionPath = "collection.json"

-- Saves the given "Node" and it's children to the file defined by "collectionPath"
saveCollection :: Node -> IO ()
saveCollection collection = BL.writeFile collectionPath $ encodePretty collection

-- Loads a "Node" tree from the file defined by "collectionPath"
loadCollection :: IO (Maybe Node)
loadCollection = do
  collectionData <- BS.readFile collectionPath
  return $ decodeStrict collectionData
