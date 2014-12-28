module Handler.Home where

import Import
import Yesod.Auth

getHomeR :: Handler Html
getHomeR = do
  maid <- maybeAuthId
  defaultLayout $ do
    $(widgetFile "homepage")
