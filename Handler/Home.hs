module Handler.Home where

import Import
import Yesod.Auth

-- | Displays the main page of the application. Requires authentication.
getHomePageR :: Handler Html
getHomePageR = do
  maid <- maybeAuthId
  defaultLayout $ do
    $(widgetFile "homepage")
