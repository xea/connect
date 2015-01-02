module Handler.Home where

import Import
import Yesod.Auth

-- | Displays the main page of the application. Requires authentication.
getHomeR :: Handler Html
getHomeR = do
  maid <- maybeAuthId
  defaultLayout $ do
    $(widgetFile "homepage")
