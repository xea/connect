module Handler.Lesson where

import Import
import Connect.Core
import Connect.Store
import Connect.Util
--import Yesod.Auth

getLessonR :: String -> Handler Html
getLessonR ref = do
  defaultLayout $ do
    setTitle "Lesson"
    $(widgetFile "lesson")

