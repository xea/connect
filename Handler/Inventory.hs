module Handler.Inventory where

import Import
import Connect.Core
import Connect.Store

-- | Returns a list of items associated with the referred content group. If the
-- referred content group does not exist then an empty list will be returned.
getItemListR :: String -> Handler Value
getItemListR ref = do
  collection <- liftIO loadCollection
  return $ object [ "items" .= (findI $ lookupRef ref collection) ]
  
postItemListR :: String -> Handler Value
postItemListR ref = do
  newItem <- requireJsonBody :: Handler Item
  collection <- liftIO loadCollection
  liftIO $ saveCollection $ addItem ref newItem collection
  
  return $ object [ "result" .= ("ok" :: String) ]
