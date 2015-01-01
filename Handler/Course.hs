module Handler.Course where

import Import
import Connect.Core
import Connect.Store
import Connect.Util
--import Yesod.Auth

getCoursesR :: Handler Value
getCoursesR = do
  coll <- liftIO $ loadCollection
  return $ object [ "courses" .= zip (map groupId $ children coll) (map groupId $ children coll) ]

getCourseR :: String -> Handler Html
getCourseR ref = do
  collection <- liftIO $ loadCollection
  defaultLayout $ do
    setTitle "Course"
    $(widgetFile "course")
--2   response <- requireJsonBody :: Handler Response
--  1   maybeChallenge <- lookupSession "challenge"

getCourseSkillsR :: String -> Handler Value
getCourseSkillsR ref = do
  coll <- liftIO $ loadCollection
  let node = lookupRef ref coll
  return $ object [ "skills" .= zip (map groupId $ children node) (map groupId $ children node) ]

