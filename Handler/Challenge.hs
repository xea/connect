module Handler.Challenge where

import Import
import Connect.Core()
import Connect.Generator
import Connect.Store
import Connect.Util
import Connect.Validator
import System.Random
import Yesod.Auth

getChallengeR :: String -> Handler Html
getChallengeR ref = do
  authId <- maybeAuthId
  collection <- liftIO loadCollection
  gen <- lift $ liftIO newStdGen

  let challenge = generateChallenge ref gen collection
  setSession "challenge" $ toSession challenge

  defaultLayout $ do
    setTitle "Challenge"
    $(widgetFile "challenge")

postSolveChallengeR :: String -> Handler Value
postSolveChallengeR ref = do
  response <- requireJsonBody :: Handler Response
  maybeChallenge <- lookupSession "challenge"
  return $ object [ "result" .= checkR (fromSession maybeChallenge) response ]

getNextChallengeR :: String -> Handler Value
getNextChallengeR ref = do
  collection <- liftIO loadCollection
  gen <- lift $ liftIO newStdGen

  let challenge = generateChallenge ref gen collection
  setSession "challenge" $ toSession challenge
  return $ object [ "displayText" .= (requestText challenge) ]
