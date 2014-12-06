module Main(main) where

import Handler.Home
import Handler.Markdown
import Handler.Javascript
import Handler.Data
import Settings.StaticFiles
import Import
import Yesod.Static

mkYesodDispatch "App" resourcesApp

main :: IO ()
main = do 
  static@(Static settings) <- static "static"
  warp 3000 $ App static

-- vim: ts=2:sw=2:et
