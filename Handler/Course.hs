module Handler.Course where

import Import
import Connect.Core
import Connect.Store
--import Yesod.Auth

getCoursePageR :: String -> Handler Html
getCoursePageR ref = do
  defaultLayout $ do
    setTitle "Course"
    $(widgetFile "course")

-- Returns a list of available courses (both display name and reference id) in JSON format
getCoursesR :: Handler Value
getCoursesR = do
  coll <- liftIO $ loadCollection
  return $ object [ "courses" .= zip (map groupId $ children coll) (map groupId $ children coll) ]

