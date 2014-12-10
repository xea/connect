module Handler.Data where

import Import
import Sting

getWisdomR :: Handler Value
getWisdomR = do
  wisdom <- liftIO nextWisdom
  return $ object [ "msg" .= wisdom ]

getDataR :: Handler Value
getDataR = do
  return $ object [ "msg" .= ("data" :: String) ]

-- vim: sw=2:ts=2:et
