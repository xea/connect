module Handler.Reading where

import Import
import Core
import System.Random

getReadingR :: Handler Html
getReadingR = do
  authId <- maybeAuthId

  defaultLayout $ do
    gen <- lift $ liftIO newStdGen
    let readElems = take 33 $ readingElements gen

    setTitle "Reading practice"
    $(widgetFile "reading")
  
