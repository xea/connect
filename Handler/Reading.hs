module Handler.Reading where

import Import
import Core
import System.Random
import GHC.Generics

data Reading = Reading { readingText :: String } deriving (Show, Generic)

instance FromJSON Reading
instance ToJSON Reading

-- Display the main reading site
getReadingR :: Handler Html
getReadingR = do
  authId <- maybeAuthId

  defaultLayout $ do
    gen <- lift $ liftIO newStdGen
    let readElems = take 33 $ readingElements gen

    setTitle "Reading practice"
    $(widgetFile "reading")

postReadingR :: Handler Value
postReadingR = do
  post <- requireJsonBody :: Handler Reading
  return $ object [ "result" .= ("ok" :: String),
                    "echo" .= ((readingText post) :: String) ]
  
postReadingItemR :: Handler Value
postReadingItemR = do
  return $ object [ "status" .= ("ok" :: String) ]

