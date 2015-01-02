module Handler.Course where

import Import
import Connect.Core
import Connect.Store
--import Yesod.Auth

getCourseR :: String -> Handler Html
getCourseR ref = do
  defaultLayout $ do
    setTitle "Course"
    $(widgetFile "course")

-- Returns a list of available courses (both display name and reference id) in JSON format
getCoursesR :: Handler Value
getCoursesR = do
  coll <- liftIO $ loadCollection
  return $ object [ "courses" .= zip (map groupId $ children coll) (map groupId $ children coll) ]

getCourseSkillsR :: String -> Handler Value
getCourseSkillsR ref = do
  coll <- liftIO $ loadCollection
  let node = lookupRef ref coll
  return $ object [ "skills" .= zip (map groupId $ children node) (map groupId $ children node) ]

