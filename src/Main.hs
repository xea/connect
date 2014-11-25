module Main(main) where

import Handler.Home
import Handler.Markdown
import Import

mkYesodDispatch "App" resourcesApp

main :: IO ()
main = warp 3000 App

-- vim: ts=2:sw=2:et
