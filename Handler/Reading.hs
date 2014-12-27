module Handler.Reading where

import Import
import Content
import Core
import System.Random
import Yesod.Auth

-- Display the main reading site
getReadingR :: Handler Html
getReadingR = do
  authId <- requireAuthId
  defaultLayout $ do
    gen <- lift $ liftIO newStdGen
    collection <- lift $ liftIO loadCollectionIO
    let challenge = nextChallenge "reading-jp" gen collection

    setSession "challenge" $ toSession challenge

    setTitle "Reading practice"
    $(widgetFile "reading")

postReadingR :: Handler Value
postReadingR = do
  response <- requireJsonBody :: Handler Response
  maybeChallenge <- lookupSession "challenge"
  return $ object [ "result" .= checkR (fromSession maybeChallenge) response ]
  
postReadingItemR :: Handler Value
postReadingItemR = do
  return $ object [ "status" .= ("ok" :: String) ]

getChallengeR :: String -> Handler Value
getChallengeR groupId = do
  gen <- lift $ liftIO newStdGen
  collection <- lift $ liftIO loadCollectionIO
  let challenge = nextChallenge "reading-jp" gen collection

  setSession "challenge" $ toSession challenge

  return $ object [ "displayText" .= (displayText challenge) ]

getItemR :: String -> Handler Value
getItemR ref = do
  collection <- lift $ liftIO loadCollectionIO
  return $ object [ "items" .= (groupItems $ findGroup collection ref) ]

postItemR :: String -> Handler Value
postItemR ref = do
  collection <- lift $ liftIO loadCollectionIO
  item <- requireJsonBody :: Handler Item

  liftIO $ saveCollection $ appendItem ref collection item

  return $ object [ "result" .= ("valami" :: String) ]
