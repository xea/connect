module Handler.Skill where

import Import
import Connect.Core
import Connect.Store
--import Yesod.Auth

getSkillPageR :: String -> Handler Html
getSkillPageR ref = do
  defaultLayout $ do
    setTitle "Skill"
    $(widgetFile "skill")

getSkillsR :: String -> Handler Value
getSkillsR ref = do
  coll <- liftIO $ loadCollection
  let node = lookupRef ref coll
  return $ object [ "skills" .= zip (map groupId $ children node) (map groupId $ children node) ]

  
