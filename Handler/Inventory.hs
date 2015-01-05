module Handler.Inventory where

import Import
import Connect.Core
import Connect.Store

-- | Returns a list of items associated with the referred content group. If the
-- referred content group does not exist then an empty list will be returned.
getItemsR :: String -> Handler Value
getItemsR ref = do
  collection <- liftIO loadCollection
  return $ object [ "items" .= (findI $ lookupRef ref collection) ]
  
postItemsR :: String -> Handler Value
postItemsR ref = do
  newItem <- requireJsonBody :: Handler Item
  collection <- liftIO loadCollection
  liftIO $ saveCollection $ addItem ref newItem collection
  
  return $ object [ "result" .= ("ok" :: String), "ref" .= ref ]

-- Creates a new course
postCoursesR :: Handler Value
postCoursesR = do
  newCourse <- requireJsonBody :: Handler Node
  collection <- liftIO loadCollection
  liftIO $ saveCollection $ addNode newCourse collection
  return $ object [ "result" .= ("ok" :: String) ]

-- | Adds a new node to a referred subnode within the passed tree. 
-- If the referenced subnode does not exist then the modification will be discarded
postNodeR :: String -> Handler Value
postNodeR ref = do
  newNode <- requireJsonBody :: Handler Node
  collection <- liftIO loadCollection
  liftIO $ saveCollection $ addNodeR ref newNode collection
  return $ object [ "result" .= ("ok" :: String) ]

postLessonsR :: String -> Handler Value
postLessonsR = postNodeR

postSkillsR :: String -> Handler Value
postSkillsR = postNodeR
