module Handler.Inventory where

import Import
import Connect.Core
import Connect.Store

getItemListR :: String -> Handler Value
getItemListR ref = do
  collection <- liftIO loadCollection
  return $ object [ "items" .= (findI $ lookupRef ref collection) ]
  
