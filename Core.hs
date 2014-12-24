module Core where

import Control.Monad ()
import Data.List
import Data.Text as T (pack, unpack)
--import Data.UUID
import GHC.Generics
import Import
import System.Random

data ReadingElem = ReadingElem { symbol :: String, readings :: [ String ] } deriving (Show, Read)
data ReadingGroup = ReadingGroup { groupName :: String, groupElements :: [ ReadingElem ] } deriving (Show, Read)
data ReadingChallenge = ReadingChallenge { challengeElems :: [ ReadingElem ] } deriving (Show, Read)
data Reading = Reading { readingText :: String } deriving (Show, Generic)

instance FromJSON Reading
instance ToJSON Reading

-- data definition
allGroups :: [ ReadingGroup ]
allGroups = [ ReadingGroup "group1" [ ReadingElem "a" ["a"], 
                                      ReadingElem "i" ["i"],
                                      ReadingElem "u" ["u"]],
              ReadingGroup "group2" [] ]

-- data lookup
findGroup :: String -> Maybe ReadingGroup
findGroup gid = find (\rgroup -> groupName rgroup == gid) allGroups

findGroups :: String -> [ ReadingGroup ]
findGroups gid = filter (\rgroup -> groupName rgroup == gid) allGroups

groupNames :: [ String ]
groupNames = map groupName allGroups

groupElems :: String -> [ ReadingElem ]
groupElems gid = case (findGroup gid) of
                            Nothing -> []
                            Just rgroup -> groupElements rgroup

-- element generatrion
readingElements :: String -> StdGen -> [ ReadingElem ]
readingElements gid gen = map (groupElems gid !!) $ randomRs (0, (length $ groupElems gid) - 1) gen

nextChallenge :: String -> Int -> StdGen -> ReadingChallenge
nextChallenge gid itemCount gen = ReadingChallenge $ take itemCount $ readingElements gid gen

showChallenge :: ReadingChallenge -> String
showChallenge ch = intercalate " " $ map symbol (challengeElems ch)

-- session management
challengeToSession :: ReadingChallenge -> Text
challengeToSession challenge = pack $ show challenge

challengeFromSession :: Maybe Text -> Maybe ReadingChallenge
challengeFromSession Nothing = Nothing
challengeFromSession (Just challenge) = Just (read $ unpack challenge)

-- input handling
checkChallenge :: Maybe ReadingChallenge -> Reading -> String
checkChallenge Nothing reading = "error"
checkChallenge (Just challenge) reading = "ok"

matchesElem :: ReadingElem -> String -> Bool
matchesElem relem post = any (\reading -> reading == post) $ readings relem

{-
validateInput :: Maybe Text -> String
validateInput Nothing = ""
validateInput (Just post) = unpack post
-}
