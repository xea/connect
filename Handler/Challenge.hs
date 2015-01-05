module Handler.Challenge where

import Import
import Connect.Core()
import Connect.Generator
import Connect.Store
import Connect.Util
import Connect.Validator
import System.Random

getChallengePageR :: String -> Handler Html
getChallengePageR ref = do
  collection <- liftIO loadCollection
  gen <- lift $ liftIO newStdGen

  let challenge = generateChallenge ref gen collection
  setSession "challenge" $ toSession challenge

  defaultLayout $ do
    setTitle "Challenge"
    $(widgetFile "challenge")

postChallengeR :: String -> Handler Value
postChallengeR ref = do
  response <- requireJsonBody :: Handler Response
  maybeChallenge <- lookupSession "challenge"
  return $ object [ "result" .= checkR (fromSession maybeChallenge) response ]

getChallengeR :: String -> Handler Value
getChallengeR ref = do
  collection <- liftIO loadCollection
  gen <- lift $ liftIO newStdGen

  let challenge = generateChallenge ref gen collection
  setSession "challenge" $ toSession challenge
  return $ object [ "displayText" .= (requestText challenge) ]
