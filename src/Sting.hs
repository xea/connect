module Sting(nextWisdom) where

import System.Random

wisdomSource = [  "Sting vagyok",
                  "Bena vagy" ]

randomId' :: IO Int
randomId' = randomRIO (0, (length wisdomSource) - 1)

getWisdom :: IO Int -> IO String
getWisdom i = fmap (\x -> wisdomSource !! x) i

nextWisdom :: IO String
nextWisdom = getWisdom randomId'

-- vim: sw=2:ts=2:et
