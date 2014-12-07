module Sting(nextWisdom) where

import System.Random

wisdomSource = [ "Ebben nem értünk egyet. Én ennek a fordítottját gondolom. Pedig én a PHP 4 idejében is dolgoztam PHP-val (és más nyelvekkel is). A PHP pont, hogy a PHP 4 után vált alkalmassá komoly feladatokra is.",
                 "Egyrészt az \"általános célú nyelv\" nem azt jelenti, amit te a jelek szerint gondolsz róla.",
                 "Ezzel összefüggésben a PHP igenis nem, hogy általános célú nyelv, de pontosan annyira általános célú, mint a C++." ]

randomId' :: IO Int
randomId' = randomRIO (0, (length wisdomSource) - 1)

getWisdom :: IO Int -> IO String
getWisdom i = fmap (\x -> wisdomSource !! x) i

nextWisdom :: IO String
nextWisdom = getWisdom randomId'

-- vim: sw=2:ts=2:et
