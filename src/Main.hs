module Main(main) where

import Network.HTTP.Client.Conduit (newManager)
import Yesod
import Yesod.Static
import Dispatch ()
import Foundation

main :: IO ()
main = do 
  static@(Static settings) <- static "static"
  manager <- newManager
  warpEnv $ App static $ manager

-- vim: ts=2:sw=2:et
