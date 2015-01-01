module Handler.Challenge where

import Import
import Connect.Core
import Connect.Store
import Connect.Util
--import Yesod.Auth

getChallengeR :: String -> Handler Html
getChallengeR ref = do
  defaultLayout $ do
    setTitle "Challenge"
