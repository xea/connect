module Handler.Home where

import Import
import Connect.Core
import Connect.Store
import Yesod.Auth

-- | Displays the main page of the application. Requires authentication.
getHomeR :: Handler Html
getHomeR = do
  maid <- maybeAuthId
  coll <- liftIO $ loadCollection
  defaultLayout $ do
    $(widgetFile "homepage")
