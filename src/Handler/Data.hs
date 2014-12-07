module Handler.Data where

import Import
import Sting

result :: String
result = "lofasz"

getDataR :: Handler Value
getDataR = do
    return $ object [ "msg" .= ("valami" :: String) ]

-- vim: sw=2:ts=2:et
