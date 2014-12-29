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

collectionPath :: FilePath
collectionPath = "collection.json"

saveCollection :: Node -> IO ()
saveCollection collection = BL.writeFile collectionPath $ encodePretty collection

loadCollection :: IO (Maybe Node)
loadCollection = do
  collectionData <- BS.readFile collectionPath
  return $ decodeStrict collectionData
