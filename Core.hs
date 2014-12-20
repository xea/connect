module Core where

import Control.Monad ()
import Import
import System.Random
import Data.UUID

data ReadingElem = ReadingElem { symbol :: String, readings :: [String], elemId :: UUID } deriving (Show)
data ReadingGroup = ReadingGroup { groupElements :: [ReadingElem], groupId :: UUID } deriving (Show)

availableElements :: [String]
availableElements = [ "a", "e", "i", "o", "u" ] 

readingElements :: StdGen -> [String]
readingElements gen = map (availableElements !!) $ randomRs (0, length availableElements - 1) gen
