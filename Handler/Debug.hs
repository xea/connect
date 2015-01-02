module Handler.Debug where

import Import
import Connect.Core
import Connect.Util ()
import Connect.Store

-- serialises some test data to "collection.json" in JSON format
-- Warning: this method overwrites any currently existing collection
getWriteTestCollectionR :: Handler Value
getWriteTestCollectionR = do
  lift $ saveCollection testData
  return $ object [ "displayText" .= ("ok" :: String) ]
-- 
--  TEST DATA
--

testData :: Node
testData = Collection [  
             Group "English" [
               Group "Reading" [
                 ContentGroup "Vowels" [
                   Item "A" [ "a" ],
                   Item "E" [ "e" ],
                   Item "I" [ "i" ] ],
                 ContentGroup "Consonants" [
                   Item "B" [ "b" ],
                   Item "C" [ "c" ] ] ] ],
             Group "German" [ 
               Group "Vocabulary" [
                 ContentGroup "Farbe" [
                   Item "rot" [ "red" ],
                   Item "grün" [ "green" ],
                   Item "gelb" [ "yellow" ]
                 ] ] ],
             ContentGroup "" [] ] 
