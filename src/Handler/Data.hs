module Handler.Data where

import Import

result :: Int
result = 14

getDataR :: Handler Value
getDataR = return $ object [ "msg" .= result ]

-- vim: sw=2:ts=2:et
