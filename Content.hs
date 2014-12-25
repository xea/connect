module Content where

import Import
import Data.List (find)
import System.Random
import GHC.Generics

data Item = Item { itemId :: String, displayText :: String, answers :: [ String ] } deriving (Show, Read, Generic)
data Group = Group { groupId :: String, items :: [ Item ] } deriving (Show, Read, Generic)

allData :: [ Group ]
allData = 
  [ Group "reading-jp" 
    [ Item "ffau" "あ" [ "a" ],
      Item "ijzx" "い" [ "i" ],
      Item "bkwq" "う" [ "u" ],
      Item "vkrw" "え" [ "e" ],
      Item "werz" "お" [ "o" ]]
  ]

findGroup :: String -> Maybe Group
findGroup ref = find (\g -> ref == groupId g) allData 

groupItems :: Maybe Group -> [ Item ]
groupItems Nothing = []
groupItems (Just group) = items group

generateContent :: String -> StdGen -> (String, [ String ])
generateContent ref gen = transformI $ (randomEs gen $ groupItems(findGroup ref)) !! 0

randomEs :: StdGen -> [ Item ] -> [ Item ]
randomEs gen items = map (items !!) $ randomRs (0, length items - 1) gen

transformI :: Item -> (String, [ String ])
transformI item = (displayText item, answers item)

--readingElements :: String -> StdGen -> [ ReadingElem ]
--readingElements gid gen = map (groupElems gid !!) $ randomRs (0, (length $ groupElems gid) - 1) gen
