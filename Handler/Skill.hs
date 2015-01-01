module Handler.Skill where

import Import
import Connect.Core
import Connect.Store
import Connect.Util
--import Yesod.Auth

getSkillR :: String -> Handler Html
getSkillR ref = do
  defaultLayout $ do
    setTitle "Skill"
    $(widgetFile "skill")

getSkillDetailsR :: String -> Handler Value
getSkillDetailsR ref = do
  coll <- liftIO $ loadCollection
  let node = lookupRef ref coll
  return $ object [ "lessons" .= zip (map groupId $ children node) (map groupId $ children node) ]
  
