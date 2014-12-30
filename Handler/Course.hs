module Handler.Course where

import Import
import Connect.Core
import Connect.Store
import System.Random
import Yesod.Auth

getCoursesR :: Handler Value
getCoursesR = do
  coll <- liftIO $ loadCollection
  return $ object [ "courses" .= (map groupId $ children coll) ]

getCourseR :: String -> Handler Html
getCourseR ref = do
  defaultLayout $ do
    setTitle "Course"
--2   response <- requireJsonBody :: Handler Response
--  1   maybeChallenge <- lookupSession "challenge"
