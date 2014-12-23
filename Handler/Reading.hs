module Handler.Reading where

import Import
import Core
import System.Random

-- Display the main reading site
getReadingR :: Handler Html
getReadingR = do
  defaultLayout $ do
    gen <- lift $ liftIO newStdGen
    let challenge = nextChallenge "group1" 33 gen 

    setSession "challenge" $ challengeToSession challenge

    setTitle "Reading practice"
    $(widgetFile "reading")

postReadingR :: Handler Value
postReadingR = do
  post <- requireJsonBody :: Handler Reading
  maybeChallenge <- lookupSession "challenge"
  return $ object [ "result" .= checkChallenge (challengeFromSession maybeChallenge) post,
                    "echo" .= ((readingText post) :: String) ]
  
postReadingItemR :: Handler Value
postReadingItemR = do
  return $ object [ "status" .= ("ok" :: String) ]

