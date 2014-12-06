module Handler.Javascript where

import Import

getJavascriptR :: String -> Handler()
getJavascriptR script = sendFile "text/javascript" ("static/javascripts/" ++ script)

getStylesheetR :: String -> Handler()
getStylesheetR stylesheet = sendFile "text/css" ("static/stylesheets/" ++ stylesheet)

-- vim: sw=2:ts=2:et
