module Handler.Lesson where

import Import
import Connect.Core 
import Connect.Store 
import Connect.Util ()
--import Yesod.Auth

getLessonPageR :: String -> Handler Html
getLessonPageR ref = do
  defaultLayout $ do
    setTitle "Lesson"
    $(widgetFile "lesson")

getLessonsR :: String -> Handler Value
getLessonsR ref = do
  coll <- liftIO $ loadCollection
  let node = lookupRef ref coll
  return $ object [ "lessons" .= zip (map groupId $ children node) (map groupId $ children node) ]
