module Handler.Inventory where

import Import
import Connect.Core
import Connect.Store

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
